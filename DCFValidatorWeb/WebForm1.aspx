<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DCFValidatorWeb.WebForm1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
</head>
<body>
<form id="form1" runat="server">
<div>
First Name:
<asp:TextBox ID="txtFirstName" runat="server">
</asp:TextBox><br /><br />
Last Name:
<asp:TextBox ID="txtLastName" runat="server">
</asp:TextBox><br /><br /><br />
        
<asp:Button ID="btnSubmit" runat="server" 
            OnClick="btnSubmit_Click" 
            Text="Submit to Second Page" /><br />
</div>
</form>
</body>
</html>