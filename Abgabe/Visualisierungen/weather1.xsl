<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg"/>
	<xsl:strip-space elements="weather_data"/>
	<xsl:template match="weather_data">
		<svg xmlns:svg="http://www.w3.org/2000/svg" width="800" height="800" style="fill:gray;">
			<xsl:for-each select="observation">
				<xsl:if test="date/LST_TIME=0">
					<xsl:variable name="s" select="date/LST_DATE"/>
					<xsl:variable name="t" select="'01'"/>
					<xsl:if test="$t=substring($s, string-length($s) - string-length($t) +1)">
						<xsl:variable name="temp" select="temperature/T_HR_AVG"/>
						<svg:text x="20" y="{105 + position() *15}">
							<xsl:value-of select="date/LST_DATE"/>
						</svg:text>
						<rect x="{position()*0.08+50}" y="{200-($temp)}" width="30" height="{$temp+100}" fill="red" stroke="black"/>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</svg>
	</xsl:template>
</xsl:stylesheet>
