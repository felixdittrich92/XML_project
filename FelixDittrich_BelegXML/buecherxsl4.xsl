<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
    <html> 
        <head>
            <title>List of Books</title>
        </head> 
        <body>
            <table class="Buecher_Jahr">
                <thead> 
                    <tr>
                        <th>Titel</th>
                        <th>Jahr</th>
                        <th>Verlag</th>
                        <th>Preis</th>
                        <th>Autoren</th>
                    </tr> 
                </thead>
                <tbody>
                <xsl:for-each select="Buecher/Buch">
                <xsl:sort select="Jahr"/>
                    <tr>
                        <td><xsl:value-of select="Titel"/></td>
                        <td><xsl:value-of select="Jahr"/></td>
                        <td><xsl:value-of select="Verlag"/></td>
                        <td><xsl:value-of select="Preis"/></td>
                        <xsl:for-each select="Autoren">
                        <td><xsl:value-of select="Autor"/></td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
                </tbody>
            </table>
            <table class="Buecher_Autor">
                <thead> 
                    <tr>
                        <th>Autoren</th>
                        <th>Titel</th>
                        <th>Jahr</th>
                        <th>Verlag</th>
                        <th>Preis</th>
                    </tr> 
                </thead>
                <tbody>
                <xsl:for-each select="Buecher/Buch">
                <xsl:sort select="Autoren/Autor"/>
                    <tr>
                        <td><xsl:value-of select="Autoren/Autor"/></td>
                        <td><xsl:value-of select="Titel"/></td>
                        <td><xsl:value-of select="Jahr"/></td>
                        <td><xsl:value-of select="Verlag"/></td>
                        <td><xsl:value-of select="Preis"/></td>
                    </tr>
                </xsl:for-each>
                </tbody>
            </table> 
        </body> 
    </html> 
    </xsl:template> 
</xsl:stylesheet>