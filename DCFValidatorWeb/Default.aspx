<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DCFValidatorWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron">
        <p class="lead">This DCF validator checks a Digtal Case File to ensure it is both well formed against the JSON Schema version 1.1.0 and complies with the additional business rules.</p>
         <a class="btn btn-default" href="#Capabilities">Learn more &raquo;</a>
        </div>
            <h3>Copy DCF JSON file here:</h3>
        <p>
            <asp:TextBox ID="JsonSrc" runat="server" Height="223px" style="margin-top: 0px" Width="100%" Rows="100" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>
            <asp:LinkButton ID="ValidateDCF" runat="server"  class="btn btn-primary btn-lg" OnClick="ValidateDCF_OnClick">Validate</asp:LinkButton>
        </p>
        <p></p>
        <h3>Results:</h3>
        <p>
        <asp:TextBox ID="OutputText" runat="server" Height="223px" style="margin-top: 0px" Width="100%" TextMode="MultiLine" BorderStyle="Dashed" BorderWidth="1px" CssClass="alert-info"></asp:TextBox>
        </p>
        <div class="col-md-4">

        <h2 id="Capabilities">Capabilities</h2>
            This validator will:
            <ul>
                <li>Check that the JSON provided is well formed.</li>
                <li>Check compliance against the DCF Schema 1.1.0</li>
                <li>Check that 0..1 Fields with Must conditions are provided when required</li>
                <li>Check that 0..1 Fields with Must conditions not provided when not required</li>
                <li>Check that NGAP Only fields are not provided when the file is GAP</li>
            </ul>

            This validator does not currently:
            <ul>
                <li>Work for BoB DCFs</li>
                <li>Verify the referential integrity of "soft-links" for the Property and MME objects</li>
                <li>Verify Rules dependant upon the Defendant's age</li>
            </ul>

            Valiation Checks are currently missing for the following fields:
            <ul>
                <li>expert_evidence</li>
                <li>relied_upon_trial & relied_upon_sentence</li>
                <li>interpretor_required (Victim)</li>
                <li>wish_to_use_video_link & special_measures combo with NGAP rule (Victim)</li>
                <li<>url (Victim)
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Draft DCF 1.1.0 Schema</h2>
            <p>
                The Draft 1.1.0 Schema used by this Validator is here.
            </p>
            <p>
                <a class="btn btn-default" href="Custom_Files/First%20Hearing%20DCF%20Schema%20110.json">Found here: &raquo;</a>
                <a class="btn btn-default" href="Custom_Files/Business Rules.json" target="_blank">Business Rules &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Example DCF Files</h2>
            <p>
                Some Example DCF Files to Try:
            </p>
            <p>
                <a class="btn btn-default" href="Custom_Files/First Hearing Example 1 - Single Defendant 110.json" target="_blank">Valid: Simple File Test File, with Single Defendant &raquo;</a>
                <a class="btn btn-default" href="Custom_Files/First Hearing Example 2 - Invalid Schema.json" target="_blank">Invalid: Fail's to comply with DCF Json Schema &raquo;</a>
                <a class="btn btn-default" href="Custom_Files/First Hearing Example 3 - Missing Fields.json" target="_blank">Invalid: Has missing Dependant fields &raquo;</a>
                <a class="btn btn-default" href="Custom_Files/First Hearing Example 4 - Additional Fields (Dependant).json" target="_blank">Invalid: Has additional fields &raquo;</a>
                <a class="btn btn-default" href="Custom_Files/First Hearing Example 5 - NGAP Violation (when GAP) - Copy.json" target="_blank">Invalid: Is a GAP file which contains NGAP fields &raquo;</a>
            </p>
        </div>
</asp:Content>
