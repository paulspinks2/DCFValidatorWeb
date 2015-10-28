<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DCFValidatorWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p class="lead">Welcome to the DCF Validation site. This sight contains the latest version of the DCF schema &amp; a suite of test files, including the JSON for the DCF Scenarios (available seperately). </p>
        <p class="lead">
            The Official Schema and Business Rule Validator can be found here:&nbsp;
        <a class="btn btn-default" href="https://dcf-validator.herokuapp.com/case-files">Official Validator &raquo;</a>
        </p>
        <a class="btn btn-default" href="#Capabilities">Learn more &raquo;</a>
    </div>

    <h2>Draft DCF Schema 1.1.0 Draft 7</h2>
    <p>
        The Draft 1.1.0 Schema used by both Validators is here.
    </p>
    <p>
        <a class="btn btn-default" href="Custom_Files/First%20Hearing%20DCF%20Schema%20110.json">DCF Schema 1.1.0 Draft 7: &raquo;</a>
    </p>
    <table>
        <tr>
            <td valign="top">
                <h2>DCF Test Scenario Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 1 - S5 Public Order.json" target="_blank">Scenario 1: S5 Public Order &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 2 - Retail Theft GAP.json" target="_blank">Scenario 2: Retail Theft GAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 3 - Retail Theft NGAP.json" target="_blank">Scenario 3: Retail Theft NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 4 - Assault DV NGAP.json" target="_blank">Scenario 4: Assault DV NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 5 - Dangerous Driving PCR Summons.json" target="_blank">Scenario 5: Dangerous Driving PCR Summons &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V1.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V1 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V2.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V2 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Scenario 7 - Multiple Defendants Offences Mixed Pleas.json" target="_blank">Scenario 7: Multiple Defendants Offences Mixed Pleas &raquo;</a><br />
                </p>
            </td>
            <td valign="top">
                <h2>Other Test Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 1 - Single Defendant 110.json" target="_blank">Valid: Simple File Test File, with Single Defendant &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 2 - Invalid Schema.json" target="_blank">Invalid: Fail's to comply with DCF Json Schema &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 3 - Missing Fields.json" target="_blank">Invalid: Has missing Dependant fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 4 - Additional Fields (Dependant).json" target="_blank">Invalid: Has additional fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 5 - NGAP Violation (when GAP).json" target="_blank">Invalid: Is a GAP file which contains NGAP fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 6 - Invalid MME Reference.json" target="_blank">Invalid: MME Reference &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 7 - Invalid Inclusion of MMENotRecorded.json" target="_blank">Invalid: Inclusion of MMENot Recorded when MME on the Case &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 8 - Valid contains no MME.json" target="_blank">Valid: Contains No MME &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 9 - Valid Two Defendants.json" target="_blank">Valid: 2 Defendant Example &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 10 - Invalid Single Defendant Youth.json" target="_blank">Invalid: Single Defendant - Youth &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 11 - Missing Schema mandated field.json" target="_blank">Invalid: Missing Schema mandated field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 12 - Ilegal field.json" target="_blank">Invalid: Illegal Field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/First Hearing Example 13 - Invalid Property Reference.json" target="_blank">Invalid: Invalid Property Reference &raquo;</a><br />
                    <a class="btn btn-default" href="First Hearing Example 14 - Missing Common Law Disclosure Details.json" target="_blank">Invalid: Missing Common Law Disclosure Details &raquo;</a><br />
                </p>
            </td>
        </tr>
    </table>
    <hr />
    <h4>The validator below is being retained as it gives slightly more informative errors for Schema violations and invalid json than the validator at the address above - it no longer validates the DCF business rules.</h4>
    <h3>Copy DCF JSON file here:</h3>
    <p>

        <asp:TextBox ID="JsonSrc" runat="server" Height="223px" Style="margin-top: 0px" Width="100%" Rows="100" TextMode="MultiLine"></asp:TextBox>

    </p>
    <p>
        <asp:LinkButton ID="ValidateDCF" runat="server" class="btn btn-primary btn-lg" OnClick="ValidateDCF_OnClick">Validate</asp:LinkButton>&nbsp
            <asp:LinkButton ID="Preview" runat="server" class="btn btn-danger btn-lg" OnClick="DCFPreview_OnClick" Visible="False">Preview</asp:LinkButton>
    </p>
    <p></p>
    <h3>Results:</h3>
    <p>
        <asp:TextBox ID="OutputText" runat="server" Height="223px" Style="margin-top: 0px" Width="100%" TextMode="MultiLine" BorderStyle="Dashed" BorderWidth="1px" CssClass="alert-info"></asp:TextBox>
    </p>
</asp:Content>
