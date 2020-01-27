<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
	<xsl:output method="xml" doctype-system="about:legacy-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title/>
			</head>
			<body>
				<h1>Wetterdaten vom 1.1.2018</h1>
				<h2>Tagestemperatur</h2>
				<xsl:variable name="height" select="200"/>
				<xsl:variable name="width" select="600"/>
				<xsl:variable name="offset" select="$height div 2"/>
				<xsl:variable name="rectSpacing" select="($width*0.95) div (count(weather_data/observation))"/>
				<xsl:variable name="scale" select="5"/>
				<svg xmlns="http://www.w3.org/2000/svg" width="{$width}" height="{$height}">
					<line x1="0" x2="0" y1="0" y2="{$height}" stroke-width="1" stroke="black"/>
					<line x1="0%" x2="{$width}" y1="{$offset}" y2="{$offset}" stroke-width="1" stroke="black"/>
					<xsl:for-each select="weather_data/observation">
						<xsl:variable name="value" select="temperature/T_MAX"/>
						<xsl:variable name="rectHeight">
							<xsl:choose>
								<xsl:when test="$value &gt; 0">
									<xsl:value-of select="($scale * temperature/T_MAX)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="-($scale * temperature/T_MAX)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>"
						<xsl:variable name="y">
							<xsl:choose>
								<xsl:when test="$value &gt; 0">
									<xsl:value-of select="($offset)-($rectHeight)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$offset"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="x" select="position()*($rectSpacing)"/>
						<rect x="{$x}" y="{$y}" width="{($rectSpacing) div 2}" height="{$rectHeight}" fill="blue" stroke="black"/>
						<xsl:variable name="i" select="position()"/>
						<!--text x="{$x}" y="{($y)-5}"><xsl:value-of select="."/></text-->
					</xsl:for-each>
				</svg>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
