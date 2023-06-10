<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="dir" select="'.'" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Directory Listing - <xsl:value-of select="$dir"/></title>
      </head>
      <body>
        <h1>Directory Listing - <xsl:value-of select="$dir"/></h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Type</th>
          </tr>
          <xsl:for-each select="document(concat($dir, '/.'))/*[not(self::element())]">
            <tr>
              <td>
                <a href="{concat($dir, '/', .)}"><xsl:value-of select="."/></a>
              </td>
              <td>File</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
