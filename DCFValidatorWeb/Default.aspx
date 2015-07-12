<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DCFValidatorWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron">
        <h1 class="h1">DCF Validator</h1>
        <p class="lead">The DCF Validator validates a Digtal Case File to ensure it is both well formed against the JSON Schema version 1.1.0 and complies with the additional business rules.</p>
        </div>

            <h2>Copy DCF JSON File Here:</h2>
        <p>
            <asp:TextBox ID="JsonSrc" runat="server" Height="223px" style="margin-top: 0px" Width="100%" Rows="100" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>
            <asp:LinkButton ID="ValidateDCF" runat="server"  class="btn btn-primary btn-lg" OnClick="ValidateDCF_OnClick">Validate</asp:LinkButton>
        </p>
        <p></p>
        <h2>Output:</h2>
        <p>
        <asp:TextBox ID="OutputText" runat="server" Height="223px" style="margin-top: 0px" Width="100%" TextMode="MultiLine" BorderStyle="Dashed" BorderWidth="1px" CssClass="alert-info"></asp:TextBox>
        
        </p>
        <h2>Debug:</h2>
        <p>
            <asp:TextBox ID="OutputDebug" runat="server" Height="223px" style="margin-top: 0px" Width="100%" TextMode="MultiLine"></asp:TextBox>
        </p>

</asp:Content>
