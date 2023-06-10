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
          <xsl:for-each select="document(concat($dir, '/.'))/*">
            <tr>
              <td>
                <xsl:choose>
                  <xsl:when test="self::text()">
                    <a href="{concat($dir, '/', .)}"><xsl:value-of select="."/></a>
                  </xsl:when>
                  <xsl:when test="self::element()">
                    <a href="{concat($dir, '/', name())}"><xsl:value-of select="name()"/></a>
                  </xsl:when>
                </xsl:choose>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="self::text()">File</xsl:when>
                  <xsl:when test="self::element()">Directory</xsl:when>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
