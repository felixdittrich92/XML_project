<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:foo="http://www.foo.org/" xmlns:bar="http://www.bar.org">
<xsl:template match="/">
  <html>
  <body>
  <h2>weather_data</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>date</th>
        <th>temperature</th>
      </tr>
      <xsl:for-each select="weather_data">
      <tr>
        <td><xsl:value-of select="UTC_DATE"/></td>
        <td><xsl:value-of select="T_MAX"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>