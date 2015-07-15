using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Schema;
using Newtonsoft.Json.Linq;
using System.Xml.Linq;

namespace DCFValidatorWeb
{
    public partial class DCF_Preview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String txtPbFirstName = Request.Form["txtFirstName"];
            //String txtPbLastName = Request.Form["txtLastName"];
            //Label1.Text = "Welcome " + txtPbFirstName + " " + txtPbLastName;

            String json = Request.Form["ctl00$MainContent$JsonSrc"];
            //Response.Write(json);

            XNode node = JsonConvert.DeserializeXNode(json, "Root");

            String responseString = "";
            responseString = "<?xml version =\"1.0\" encoding =\"UTF-8\" standalone=\"no\" ?>\n";
            responseString += "<?xml-stylesheet type=\"text/xsl\" href=\"XSLT/DCF%20XSLT.xslt\"?>\n";
            responseString += node.ToString();
            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(responseString);
        }
    }
}