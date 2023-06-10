<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Directory Listing - ./</title>
      </head>
      <body>
        <h1>Directory Listing - ./</h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Type</th>
          </tr>
          <xsl:for-each select="php:function('scandir', '.')/*[not(self::.)]">
            <tr>
              <td>
                <a href="{.}"><xsl:value-of select="."/></a>
              </td>
              <td>File</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
