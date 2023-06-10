<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Filesystem Listing</title>
      </head>
      <body>
        <h1>Filesystem Listing</h1>
        <ul>
          <xsl:for-each select="/filesystem/file">
            <li>
              <xsl:value-of select="@name"/> (<xsl:value-of select="@size"/> bytes)
            </li>
          </xsl:for-each>
          <xsl:for-each select="/filesystem/directory">
            <li>
              <strong><xsl:value-of select="@name"/></strong>
              <ul>
                <xsl:for-each select="file">
                  <li>
                    <xsl:value-of select="@name"/> (<xsl:value-of select="@size"/> bytes)
                  </li>
                </xsl:for-each>
              </ul>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>