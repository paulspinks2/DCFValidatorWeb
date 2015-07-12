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
                //string json = System.IO.File.ReadAllText(System.Configuration.ConfigurationManager.AppSettings["rulesPath"]);
                string json = System.IO.File.ReadAllText(HttpRuntime.AppDomainAppPath + "\\Custom_Files\\rules.json");
                loadedRules = JsonConvert.DeserializeObject<RulesDataSet>(json);
            }
            catch (Exception ex)
            {
                OutputText.Text = "Error: Unable to Load Rules: " + ex.Message;
                OutputText.CssClass = "alert-danger";
            }
        }

        protected void LoadDCFSchema()
        {
            try
            {
                // load JSchema directly from a file
                //string schemaPath = System.Configuration.ConfigurationManager.AppSettings["schemaPath"];
                string schemaPath = HttpRuntime.AppDomainAppPath + "\\Custom_Files\\First Hearing DCF Schema 100.json";
                using (StreamReader file = File.OpenText(schemaPath))
                using (JsonTextReader reader = new JsonTextReader(file))

                    schema = JSchema.Load(reader);
            } catch (Exception ex)
            {
                OutputText.Text = "Error: Unable to Load Rules: " + ex.Message;
                OutputText.CssClass = "alert-danger";
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
            try
            {
                inputJson = JObject.Parse(JsonSrc.Text);
            }
            catch (Exception e)
            {
                OutputText.Text = e.ToString();
            }

            IList<string> messages;
            bool valid = inputJson.IsValid(schema, out messages);

            if (valid)
            {
                //Valid
                OutputText.Text = "The file provided is well form and matches the JSON Schema \n";
                OutputText.CssClass = "alert-success";
            }
            else
            {
                //Valid
                OutputText.Text = "DCF Schema 1.1.0 Validation Error. Errors Below: \n";
                OutputText.CssClass = "alert-danger";

                // invalid
                foreach (string message in messages)
                {
                    OutputText.Text = message;
                }
            }

            //Business Rule Validation
            bool isGap = true;
            FirstPass(ref isGap);
            if (isGap)
            {
                CheckGap();
            }
        }

        protected void FirstPass(ref bool isGap)
        {
            JsonTextReader reader = new JsonTextReader(new StringReader(JsonSrc.Text));
            while (reader.Read())
            {
                if (reader.Value != null)
                {
                    OutputDebug.Text += reader.Path + "->" + reader.Value + " Type:" + reader.TokenType + "\n";
                }
                else
                    OutputDebug.Text += reader.Path + " Type:" + reader.TokenType + "\n";

                //Check Rules

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

                //Check to see if this field is Anticpated Plea. If Anticipated Plea
                if (attributeName == "anticipated_plea") {
                    string value = reader.Value.ToString();
                    if (value == "not_guilty") {
                    isGap = false;
                    }
                }

                //See if this is a Source Field for checking other dependancy conditions

                    if (attributeName != "")
                {
                    var query = from loadedDependantField in loadedRules.DependantFields.AsEnumerable()
                                where loadedDependantField.SourceAttribute == attributeName
                                select new
                                {
                                    loadedDependantField.DependantAttribute,
                                    loadedDependantField.Rule,
                                    loadedDependantField.SourceAttribute,
                                    loadedDependantField.SourceCondition
                                };

                    //For each dependant field rule check that it is obeyed by objects at the same path level
                    foreach (var match in query)
                    {
                        //Check that the condition is met
                        string value = reader.Value.ToString();
                        if (value == match.SourceCondition)
                        {
                            OutputDebug.Text += "Found rule match condition on SourceField " + reader.Path + "\n";

                            //Try and Find Target Attribute at same path

                            try
                            {
                                String text = inputJson.SelectToken(path + match.DependantAttribute).ToString();
                                OutputDebug.Text += "Found associated TargetField: " + text + "\n";
                            }
                            catch
                            {
                                OutputText.Text += "Business Rule Validation error: " + match.DependantAttribute + " not found when " + match.SourceAttribute
                                    + " is " + match.SourceCondition;
                                OutputText.CssClass = "alert-danger";
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

                if (attributeName != "")
                {
                    var query = from loadedNGAPAttribute in loadedRules.NGAPOnly.AsEnumerable()
                                where loadedNGAPAttribute.Attribute == attributeName
                                select new
                                {
                                    loadedNGAPAttribute.Attribute
                                };
                    foreach (var match in query)
                    {
                        OutputText.Text += "Business rule validation error: This DCF Should be prepared as GAP, but contains " + reader.Path + "\n";
                        OutputText.CssClass = "alert-danger";
                    }
                }
            }
        }
    }
}
