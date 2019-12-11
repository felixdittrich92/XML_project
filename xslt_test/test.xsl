<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
    <html> 
        <head>
            <title>weather my friend this weather</title>
        </head> 
        <body>
            <table class="weather_data">
                <thead> 
                    <tr>
                        <th>T_CALC</th>
                        <th>T_HR_AVG</th>
                        <th>T_MAX</th>
                        <th>T_MIN</th>
                    </tr> 
                </thead>
                <tbody>
                <xsl:for-each select="weather_data/observation">
                    <tr>
                        <xsl:for-each select="temperature">
                        <td><xsl:value-of select="T_CALC"/></td>
                        <td><xsl:value-of select="T_HR_AVG"/></td>
                        <td><xsl:value-of select="T_MAX"/></td>
                        <td><xsl:value-of select="T_MIN"/></td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
                </tbody>
            </table> 
        </body> 
    </html> 
    </xsl:template> 
</xsl:stylesheet>