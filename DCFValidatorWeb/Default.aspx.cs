using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Schema;
using Newtonsoft.Json.Linq;

namespace DCFValidatorWeb
{

    public partial class _Default : System.Web.UI.Page
    {
        private JSchema schema;
        private JObject inputJson;
        private RulesDataSet loadedRules = new RulesDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRules();
            LoadDCFSchema();
        }

        protected void LoadRules()
        {
            try
            {
                string json = System.IO.File.ReadAllText(HttpRuntime.AppDomainAppPath + "\\Custom_Files\\Business Rules.json");
                loadedRules = JsonConvert.DeserializeObject<RulesDataSet>(json);
            }
            catch (Exception ex)
            {
                OutputText.Text = "Error: Unable to Load Rules: " + ex.Message;
                OutputText.CssClass = "alert-danger";
                ValidateDCF.Enabled = false;
            }
        }

        protected void LoadDCFSchema()
        {
            try
            {
                // load JSchema directly from a file
                string schemaPath = HttpRuntime.AppDomainAppPath + "\\Custom_Files\\First Hearing DCF Schema 110.json";
                using (StreamReader file = File.OpenText(schemaPath))
                using (JsonTextReader reader = new JsonTextReader(file))

                    schema = JSchema.Load(reader);
            } catch (Exception ex)
            {
                OutputText.Text = "Error: Unable to Load Schema: " + ex.Message;
                OutputText.CssClass = "alert-danger";
                ValidateDCF.Enabled = false;
            }

        }

        protected void ValidateDCF_OnClick(object sender, EventArgs e)
        {
            OutputText.Text = "";
            OutputText.CssClass = "alert-info";

            ValidateJSON();
        }

        protected void ValidateJSON()
        {
            bool valid = false;
            IList<string> messages;
            try
            {
                inputJson = JObject.Parse(JsonSrc.Text);

                valid = inputJson.IsValid(schema, out messages);

                if (valid)
                {
                    //Valid
                    OutputText.Text = "The file provided is well form and matches the JSON Schema \n";
                    OutputText.CssClass = "alert-success";

                    //Business Rule Validation
                    bool isGap = true;
                    FirstPass(ref isGap);
                    if (isGap)
                    {
                        CheckGap();
                    }
                }
                else
                {
                    //Invalid
                    OutputText.Text = "DCF Schema 1.1.0 Validation Error. Errors Below: \n";
                    OutputText.CssClass = "alert-danger";

                    foreach (string message in messages)
                    {
                        OutputText.Text += message + "\n";
                    }
                }
            }
            catch (Exception e)
            {
                OutputText.Text = e.Message;
                OutputText.CssClass = "alert-danger";
            }
        }

    protected void FirstPass(ref bool isGap)
        {
            JsonTextReader reader = new JsonTextReader(new StringReader(JsonSrc.Text));
            while (reader.Read())
            {
                //Check Business Rules if the tokens are of the correct types
                if (reader.TokenType == JsonToken.String || reader.TokenType == JsonToken.Float || reader.TokenType == JsonToken.Boolean)
                {
                    {
                        //Determine the path and attribute name
                        String path = reader.Path;
                        String attributeName;

                        if (path.IndexOf(".") > 0)
                        {
                            attributeName = path.Substring(path.LastIndexOf(".") + 1);
                            path = path.Substring(0, path.LastIndexOf(".")) + ".";
                        }
                        else
                        {
                            //Root Object
                            path = "";
                            attributeName = reader.Path;
                        }

                        //Clean off any array counts on the attribute name
                        if (attributeName.Contains("["))
                        {
                            attributeName = attributeName.Substring(0, attributeName.IndexOf("["));
                        }

                        //Check to see if this field is Anticpated Plea. If Anticipated Plea
                        if (attributeName == "anticipated_plea")
                        {
                            string value = "";
                            value = reader.Value.ToString();
                            if (value == "not_guilty")
                            {
                                isGap = false;
                            }
                        }

                        //See if this is a Source Field for checking other dependancy conditions. If so, Check that those conditions are met.

                        if (attributeName != "")
                        {
                            var query = from loadedDependantAttribute in loadedRules.DependantAttributes.AsEnumerable()
                                        where loadedDependantAttribute.SourceAttribute == attributeName
                                        select new
                                        {
                                            loadedDependantAttribute.RuleName,
                                            loadedDependantAttribute.DependantAttribute,
                                            loadedDependantAttribute.SourceAttribute,
                                            loadedDependantAttribute.SourceCondition,
                                            loadedDependantAttribute.AndRuleName
                                        };

                            //For each dependant field rule check that it is obeyed by objects at the same path level
                            foreach (var match in query)
                            {
                                bool needTofind = true;
                                //Check that the condition is met
                                string value = reader.Value.ToString();
                                if (value == match.SourceCondition.ToString())
                                {

                                    //Check to see if this condition has an "AND" condition
                                    if (match.AndRuleName.ToString() != "")
                                    {

                                        //Load the Related Rule
                                        var andQuery = from loadedDependantField in loadedRules.DependantAttributes.AsEnumerable()
                                                       where loadedDependantField.RuleName == match.AndRuleName.ToString()
                                                       select new
                                                       {
                                                           loadedDependantField.RuleName,
                                                           loadedDependantField.DependantAttribute,
                                                           loadedDependantField.SourceAttribute,
                                                           loadedDependantField.SourceCondition,
                                                           loadedDependantField.AndRuleName
                                                       };

                                        //Check the Value of the AND Condition attribute
                                        foreach (var andMatch in andQuery)
                                        {
                                            try
                                            {
                                                String andValue = inputJson.SelectToken(path + andMatch.SourceAttribute).ToString();

                                                if (andMatch.SourceCondition == andValue)
                                                {
                                                    needTofind = true;
                                                }

                                            }
                                            catch
                                            {
                                                //The and condition was not found
                                                needTofind = false;
                                            }
                                        }

                                    }

                                    //Try and Find Target Attribute at same path
                                    if (needTofind)
                                    {
                                        try
                                        {
                                            String text = inputJson.SelectToken(path + match.DependantAttribute).ToString();
                                        }
                                        catch
                                        {
                                            OutputText.Text += "Business Rule Validation error: Missing Attribute " + match.DependantAttribute + " not found when " + match.SourceAttribute
                                                + " is " + match.SourceCondition + "\n";
                                            OutputText.CssClass = "alert-danger";
                                        }
                                    }
                                }
                            }

                            //Check if this field is Dependent on the value of a Parent field
                            var parentQuery = from loadedDependantAttribute in loadedRules.DependantAttributes.AsEnumerable()
                                              where loadedDependantAttribute.DependantAttribute == attributeName
                                              select new
                                              {
                                                  loadedDependantAttribute.RuleName,
                                                  loadedDependantAttribute.DependantAttribute,
                                                  loadedDependantAttribute.SourceAttribute,
                                                  loadedDependantAttribute.SourceCondition,
                                                  loadedDependantAttribute.AndRuleName
                                              };
                            foreach (var match in parentQuery)
                            {
                                //Check that the condition is met
                                //Try and find the parent attribute on the same path 
                                try
                                {
                                    String text = inputJson.SelectToken(path + match.SourceAttribute).ToString();

                                    //If the parent is found, check the value is correct.
                                    if (match.SourceCondition != text) {
                                        OutputText.Text += "Business Rule Validation error: Additional Attribute " + match.DependantAttribute + " present when " + match.SourceAttribute
                                        + " " + text;
                                        OutputText.CssClass = "alert-danger";
                                    }
                                }
                                catch
                                {
                                    //If the parent can't be found, the child shouldn't be present either.
                                    OutputText.Text += "Business Rule Validation error: Additional Attribute " + match.DependantAttribute + " present when " + match.SourceAttribute
                                        +  match.SourceCondition + "not present" + "\n";
                                    OutputText.CssClass = "alert-danger";
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void CheckGap()
        {
            //Check the fields not allowed in GAP cases are not present
            JsonTextReader reader = new JsonTextReader(new StringReader(JsonSrc.Text));
            while (reader.Read())
            {
                //Determine the path and attribute name
                String path = reader.Path;
                String attributeName;

                if (path.IndexOf(".") > 0)
                {
                    attributeName = path.Substring(path.LastIndexOf(".") + 1);
                    path = path.Substring(0, path.LastIndexOf(".")) + ".";
                }
                else
                {
                    //Root Object
                    path = "";
                    attributeName = reader.Path;
                }

                if (attributeName != "" & reader.TokenType != JsonToken.PropertyName)
                {
                    var query = from loadedNGAPAttribute in loadedRules.NGAPOnly.AsEnumerable()
                                where loadedNGAPAttribute.Attribute == attributeName
                                select new
                                {
                                    loadedNGAPAttribute.Attribute
                                };
                    foreach (var match in query)
                    {
                        OutputText.Text += "Business rule validation error: This DCF should be prepared as GAP, but contains " + reader.Path + "\n";
                        OutputText.CssClass = "alert-danger";
                    }
                }
            }
        }
    }
}
