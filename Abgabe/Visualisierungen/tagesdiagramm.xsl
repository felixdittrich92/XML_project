<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg">
	<xsl:output method="xml" doctype-system="about:legacy-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title/>
			</head>
			<body>
				<xsl:variable name="height" select="400"/>
				<xsl:variable name="width" select="1200"/>
				<xsl:variable name="offset" select="($height div 4)*3"/>
				<xsl:variable name="scale" select="5"/>
				<svg xmlns="http://www.w3.org/2000/svg" width="{$width}" height="{$height}">
					<!--Y-axis description-->
					<text x="96%" y="280">Zeit</text>
					<xsl:for-each select="weather_data/observation">
						<xsl:if test="position() &lt; 11">
							<xsl:variable name="x" select="5"/>
							<xsl:variable name="y" select="(($height) div 10)* position() - (($height) div 20 )"/>
							<text x="{$x}" y="{$y}">
								<xsl:value-of select="((($height)-$y)-(($height)-$offset)) div ($scale)"/>°C</text>
						</xsl:if>
					</xsl:for-each>
					<xsl:variable name="leftPadding" select="50"/>
					<g transform="translate({$leftPadding} 0)">
						<xsl:variable name="rectSpacing" select="((($width)-($leftPadding))*0.95) div (count(weather_data/observation))"/>
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

							<xsl:variable name="hour">
								<xsl:choose>
									<xsl:when test="substring(date/LST_TIME, 4, 1) = 0">
										<xsl:value-of select="substring(date/LST_TIME, 1,2)"/>
									</xsl:when>
									<xsl:otherwise>
											<xsl:value-of select="substring(date/LST_TIME, 1,1)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<text x="{$x}" y="{$offset - 2}">
								<xsl:value-of select="$hour"/>
							</text>
							<text x="{$x}" y="{($y+$rectHeight)+ 15}">
								<xsl:value-of select="temperature/T_MAX"/>
							</text>
							<rect x="{$x}" y="{$y}" width="{($rectSpacing) div 2}" height="{$rectHeight}" fill="blue" stroke="blue"/>
						</xsl:for-each>
					</g>
				</svg>
				<p>
					Temperaturdaten vom 1.1.2018 aus Bowling Green, Kentucky
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
