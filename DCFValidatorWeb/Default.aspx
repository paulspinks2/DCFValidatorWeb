<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DCFValidatorWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p class="lead">Welcome to the DCF Validation site. This sight contains the latest version of the DCF schema &amp; a suite of test files, including the JSON for the DCF Scenarios (available separately). </p>
            <p style="color: #008000">
                16/03/2016
                <br />
                Updated with changes for 1.2.1.0
            </p>
        <p style="color: #008000">
                17/02/2016
                <br />
                Corrected missing underscore in indictable_only_or_either_way_and_likely_to_be_heard_in_the_crown_court
                <br />
                Corrected defendant_admits_being_in_mme. Removed "required" condition.
            </p>


            <p style="color: #008000">
                14/01/2016
                  <br />
                Updated with Combined Schema 1.2.0.1 (Injuries bug fix). Seperate FH and BoB Schemas removed
            </p>
            <p style="color: #008000">
                15/12/2015
                  <br />
                Updated to Final, in line with DCF 1.2.0 Final
            </p>
        <p class="lead">
            The Official Schema and Business Rule Validator can be found here&nbsp;
        <a class="btn btn-default" href="https://dcf-validator.herokuapp.com/case-files">Official Validator &raquo;</a>
        </p>
        <a class="btn btn-default" href="#Capabilities">Learn more &raquo;</a>
    </div>

    <h2>DCF Schema 1.2.1.0</h2>
    <p>
        The 1.2.1 Schema is here. </p>
    <p>
        <a class="btn btn-default" href="Custom_Files/1.2.0/Combined First Hearing and BoB DCF Schema 120.json">Combined First Hearing and BoB DCF Schema 1.2.1.0: &raquo;</a>
    </p>
    <table>
        <tr>
            <td valign="top">
                <h2>DCF Test Scenario Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 1 - S5 Public Order.json" target="_blank">Scenario 1: S5 Public Order &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 2 - Retail Theft GAP.json" target="_blank">Scenario 2: Retail Theft GAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 3 - Retail Theft NGAP.json" target="_blank">Scenario 3: Retail Theft NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 4 - Assault DV NGAP.json" target="_blank">Scenario 4: Assault DV NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 5 - Dangerous Driving PCR Summons.json" target="_blank">Scenario 5: Dangerous Driving PCR Summons &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V1.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V1 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V2.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V2 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 7 - Invalid Inclusion of MMENotRecorded.json" target="_blank">Scenario 7: Multiple Defendants Offences Mixed Pleas &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - First Hearing 1.json" target="_blank">Scenario 8: First Hearing DCF &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - Breach of Bail 1.json" target="_blank">Scenario 8: Breach of Bail 1 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - Breach of Bail 2.json" target="_blank">Scenario 8: Breach of Bail 2 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - Breach of Bail 3.json" target="_blank">Scenario 8: Breach of Bail 3 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - Breach of Bail 4.json" target="_blank">Scenario 8: Breach of Bail 4 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/Breach of Bail Scenario 8 - Breach of Bail 5.json" target="_blank">Scenario 8: Breach of Bail 5 &raquo;</a><br />
                </p>
            </td>
            <td valign="top">
                <h2>Other Test Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 1 - Valid Single Defendant.json" target="_blank">Example 1: Valid: Simple File Test File, with Single Defendant &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 2 - Invalid case markers enumeration.json" target="_blank">Example 2: Invalid: Fail's to comply with DCF Json Schema &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 3 - Invalid Missing Fields.json" target="_blank">Example 3: Invalid: Has missing Dependant fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 4 - Invalid Additional Fields (Dependant).json" target="_blank">Example 4: Invalid: Has additional fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 5 - Invalid NGAP Violation (when GAP).json" target="_blank">Example 5: Invalid: Is a GAP file which contains NGAP fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 6 - Invalid MME Reference.json" target="_blank">Example 6: Invalid: MME Reference &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 7 - Invalid Inclusion of MMENotRecorded.json" target="_blank">Example 7: Invalid: Inclusion of MMENot Recorded when MME on the Case &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 8 - Valid contains no MME.json" target="_blank">Example 8: Valid: Contains No MME &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 9 - Valid Two Defendants.json" target="_blank">Example 9: Valid: 2 Defendant Example &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 10 - Invalid Single Defendant Youth.json" target="_blank">Example 10: Invalid: Single Defendant - Youth &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 11 - Invalid missing Schema mandated field.json" target="_blank">Example 11: Invalid: Missing Schema mandated field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 12 - Invalid ilegal field.json" target="_blank">Example 12: Invalid: Illegal Field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 13 - Invalid Property Reference.json" target="_blank">Example 13: Invalid: Invalid Property Reference &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 14 - Welsh Characters Example UTF8.json" target="_blank">Example 14: Welsh Characters Example UTF8 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.2.0/First Hearing Example 15 - Welsh Characters Example Escaped.json" target="_blank">Example 15: Welsh Characters Example Escaped &raquo;</a><br />
                </p>
            </td>
        </tr>
    </table>

    <h2>&nbsp;</h2>
    <hr />
    <h2 style="color: #FF0000">DEPRICATED</h2>
    <p style="color: #FF0000">The following files are provided for legacy purposes only whilst teams make the migration to 1.2.0. </p>
    <p style="color: #FF0000">A legacy 1.1.0 Draft 7 validator can be found  <a href="https://dcf-validator110.herokuapp.com/case-files">here </a></p>
    <h2>Draft DCF Schema 1.1.0 Draft 7</h2>
    <p>
        <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing DCF Schema 110.json">DCF Schema 1.1.0 Draft 7: &raquo;</a>
        <a class="btn btn-default" href="Custom_Files/1.1.0/BoB DCF Schema 110.json">DCF Schema 1.1.0 Draft 5 (BoB): &raquo;</a>
    </p>
    <table>
        <tr>
            <td valign="top">
                <h2>DCF Test Scenario Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 1 - S5 Public Order.json" target="_blank">Scenario 1: S5 Public Order &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 2 - Retail Theft GAP.json" target="_blank">Scenario 2: Retail Theft GAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 3 - Retail Theft NGAP.json" target="_blank">Scenario 3: Retail Theft NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 4 - Assault DV NGAP.json" target="_blank">Scenario 4: Assault DV NGAP &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 5 - Dangerous Driving PCR Summons.json" target="_blank">Scenario 5: Dangerous Driving PCR Summons &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V1.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V1 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 6 - S5 Public Order Multiple Defendants V2.json" target="_blank">Scenario 6: S5 Public Order Multiple Defendants V2 &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Scenario 7 - Multiple Defendants Offences Mixed Pleas.json" target="_blank">Scenario 7: Multiple Defendants Offences Mixed Pleas &raquo;</a><br />
                </p>
            </td>
            <td valign="top">
                <h2>Other Test Files</h2>
                <p>
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 1 - Valid Single Defendant.json" target="_blank">Example 1: Valid: Simple File Test File, with Single Defendant &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 2 - Invalid case markers enumeration.json" target="_blank">Example 2: Invalid: Fail's to comply with DCF Json Schema &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 3 - Invalid Missing Fields.json" target="_blank">Example 3: Invalid: Has missing Dependant fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 4 - Invalid Additional Fields (Dependant).json" target="_blank">Example 4: Invalid: Has additional fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 5 - Invalid NGAP Violation (when GAP).json" target="_blank">Example 5: Invalid: Is a GAP file which contains NGAP fields &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 6 - Invalid MME Reference.json" target="_blank">Example 6: Invalid: MME Reference &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 7 - Invalid Inclusion of MMENotRecorded.json" target="_blank">Example 7: Invalid: Inclusion of MMENot Recorded when MME on the Case &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 8 - Valid contains no MME.json" target="_blank">Example 8: Valid: Contains No MME &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 9 - Valid Two Defendants.json" target="_blank">Example 9: Valid: 2 Defendant Example &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 10 - Invalid Single Defendant Youth.json" target="_blank">Example 10: Invalid: Single Defendant - Youth &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 11 - Invalid missing Schema mandated field.json" target="_blank">Example 11: Invalid: Missing Schema mandated field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 12 - Invalid ilegal field.json" target="_blank">Example 12: Invalid: Illegal Field &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 13 - Invalid Property Reference.json" target="_blank">Example 13: Invalid: Invalid Property Reference &raquo;</a><br />
                    <a class="btn btn-default" href="Custom_Files/1.1.0/First Hearing Example 14 - Invalid missing Common Law Disclosure Details.json" target="_blank">Example 14: Invalid: Missing Common Law Disclosure Details &raquo;</a><br />
                </p>
            </td>
        </tr>
    </table>
    <hr />
</asp:Content>
