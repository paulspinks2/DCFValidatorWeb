<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <link rel="stylesheet" type="text/css" href="C:\Users\Paul\Documents\Visual Studio 2015\Projects\DCFValidatorWeb\DCFValidatorWeb\Content\bootstrap.css"/>
    <html>
      <body>
        <table width="80%" align="center">
          <tr>
            <td>
              <!--Case Summary-->
              <!--Case Title-->
              <h2 align="center">Basic DCF Preview</h2>
              <table class="table-bordered" width="100%">
                <tr>
                  <td class="label-default">PTI_URN:</td>
                  <td>
                    <xsl:value-of select="Root/pti_urn"/>
                  </td>
                  <td class="label-default">Date:</td>
                  <td>
                    <xsl:value-of select="Root/date"/>
                  </td>
                </tr>
                <tr>
                  <td class="label-default">Test code:</td>
                  <td>
                    <xsl:value-of select="Root/test_code"/>
                  </td>
                  <td class="label-default">Charge by CPS:</td>
                  <td>
                    <xsl:value-of select="Root/pca_cps"/>
                  </td>
                </tr>
                <tr>
                  <td class="label-default">Related Cases:</td>
                  <td colspan ="3">
                    <xsl:for-each select="Root/associated_case_urns">
                      <xsl:variable name="p" select="position()"/>
                      <xsl:value-of select="../associated_case_urns[$p]"/>&#160;
                    </xsl:for-each>
                  </td>
                </tr>
                <tr>
                  <td class="label-default">Case Markers:</td>
                  <td colspan ="3">
                    <xsl:for-each select="Root/case_markers">
                      <xsl:variable name="p" select="position()"/>
                      <xsl:value-of select="../case_markers[$p]"/>
                      <xsl:text> </xsl:text>
                    </xsl:for-each>
                  </td>
                </tr>
              </table>
              <p></p>
              <!--O1.O2 Defendant/Offences/RetailTheft Offences-->
              <table class="table-bordered" width="100%">
                <tr>
                  <td colspan ="2">
                    <xsl:for-each select="Root/defendants">
                      <xsl:variable name="defendants" select="position()"/>
                      <!-- Defendants-->
                      <h3 align="center">
                        Offences for Defendant
                        <xsl:for-each select="./name/given_name">
                          <xsl:variable name="given_name" select="position()"/>
                          <xsl:value-of select="../given_name[$given_name]"/>
                          <xsl:text> </xsl:text>
                        </xsl:for-each>
                        <xsl:value-of select="./name/surname[$defendants]"/>
                      </h3>
                      <xsl:for-each select="./offences">
                        <xsl:variable name="offences" select="position()"/>
                        <!--Offences-->
                        <xsl:for-each select="./retail_theft_offences">
                          <xsl:variable name="retail_theft_offences" select="position()"/>
                          <!-- Retail Theft Offences-->
                          <tr>
                            <td class="label-default" colspan ="2">
                              Offence:  <xsl:value-of select="offence/offence_title[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              Defendant:
                              <xsl:for-each select="../../name/given_name">
                                <xsl:variable name="given_name" select="position()"/>
                                <xsl:value-of select="../given_name[$given_name]"/>
                                <xsl:text> </xsl:text>
                              </xsl:for-each>
                              <xsl:value-of select="../../name/surname[$defendants]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              CJS Offence Code:  <xsl:value-of select="cjs_offence_code[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              Anticiapted Plea:  <xsl:value-of select="offence/anticipated_plea[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              Committed on bail:  <xsl:value-of select="offence/committed_on_bail[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              Charge Wording
                            </td>
                          </tr>
                          <tr>
                            <td height ="50" colspan ="2">
                              <xsl:value-of select="offence/charge_wording[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <tr>
                            <td class="label-default" colspan ="2">
                              Defendant's Reply to Charge(s)
                            </td>
                          </tr>
                          <tr>
                            <td height ="50" colspan ="2">
                              <xsl:value-of select="offence/reply_to_charge[$retail_theft_offences]"/>
                            </td>
                          </tr>
                          <!-- O.5 Points to Prove Met by-->
                          <tr>
                            <td class="label-default" colspan ="2">
                              Evidence which establishes the points to prove
                            </td>
                          </tr>
                          <tr>
                            <td height ="50" colspan ="2">
                              <xsl:value-of select="offence/points_to_prove_met_by[$retail_theft_offences]"/>
                            </td>
                          </tr>
                        </xsl:for-each>
                        <!--Offences-->
                      </xsl:for-each>
                    </xsl:for-each>
                  </td>
                </tr>
              </table>
              <!-- NO MORE CONTENT: End of Outer table below this line-->
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
