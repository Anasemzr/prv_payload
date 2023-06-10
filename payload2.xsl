<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Directory Listing - <xsl:value-of select="substring-before(document-uri(),'/example.xml')"/></title>
      </head>
      <body>
        <h1>Directory Listing - <xsl:value-of select="substring-before(document-uri(),'/example.xml')"/></h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Type</th>
          </tr>
          <xsl:for-each select="document(concat(substring-before(document-uri(),'/example.xml'), '/.'))/*[not(self::*)]">
            <tr>
              <td>
                <a href="{concat(substring-before(document-uri(),'/example.xml'), '/', .)}"><xsl:value-of select="."/></a>
              </td>
              <td>File</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
