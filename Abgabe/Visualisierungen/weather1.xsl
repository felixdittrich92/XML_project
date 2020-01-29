<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg"/>
	<xsl:strip-space elements="weather_data"/>
	<xsl:template match="weather_data">
		<svg xmlns:svg="http://www.w3.org/2000/svg" width="800" height="800" style="fill:gray;">
		<svg:text y="200" x="0">0°C</svg:text>
			<g transform="translate(50 0)">
				<line x1="0%" x2="100%" y2="300" y1="300" stroke="black" stroke-width="1"/>
				<line x1="0%" x2="100%" y2="200" y1="200" stroke="lightgray" stroke-width="1"/>
				<line x1="0" x2="0" y2="0" y1="300" stroke="black" stroke-width="1"/>
				
				<xsl:for-each select="observation">
					<xsl:if test="date/LST_TIME=0">
						<xsl:variable name="s" select="date/LST_DATE"/>
						<xsl:variable name="t" select="'01'"/>
						<xsl:variable name="month" select="substring($s, 5, 2)"/>
						<xsl:if test="$t=substring($s, string-length($s) - string-length($t) +1)">
							<xsl:variable name="temp" select="temperature/T_HR_AVG"/>
							<svg:text x="{(position()*0.08+50)}" y="{300+15}">
								<xsl:value-of select="$month"/>
							</svg:text>
							<svg:text x="{(position()*0.08+50)-10}" y="{200-($temp)-5}">
								<xsl:value-of select="$temp"/>
							</svg:text>
							<rect x="{position()*0.08+50}" y="{200-($temp)}" width="30" height="{$temp+100}" fill="red" stroke="black"/>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</g>
		</svg>
	</xsl:template>
</xsl:stylesheet>
