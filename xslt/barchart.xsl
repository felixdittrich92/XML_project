#TODO !!!!!


<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
xmlns="http://www.w3.org/2000/svg">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">

<xsl:variable name="max">
    <xsl:for-each select="Report/RESULTS/ROW/*">
        <xsl:sort select="." data-type="number" order="descending"/>
        <xsl:if test="position()=1">
            <xsl:value-of select="."/>
        </xsl:if>
    </xsl:for-each>
</xsl:variable>

<svg width="650" height="500">
  <g id="axis" transform="translate(0 500) scale(1 -1)">
  <line id="axis-y" x1="30" y1="20" x2="30" y2="450" style="fill:none;stroke:rgb(0,0,0);stroke-width:2"/>
  <line id="axis-x" x1="30" y1="20" x2="460" y2="20"  style="fill:none;stroke:rgb(0,0,0);stroke-width:2"/>
  </g>  
  <xsl:for-each select="Report/RESULTS/ROW">
   <g id="bars" transform="translate(30 479) scale(1 -430)">
    <rect x="30" y="0" width="50" height="{PASSED div $max}"  style="fill:rgb(81,223,13);stroke:rgb(0,0,0);stroke-width:0"/>     
    <rect x="100" y="0" width="50" height="{FAILED div $max}"  style="fill:rgb(224,12,12);stroke:rgb(0,0,0);stroke-width:0"/>  
    <rect x="170" y="0" width="50" height="{CAUTION div $max}"  style="fill:rgb(245,136,37);stroke:rgb(0,0,0);stroke-width:0"/>  
    <rect x="240" y="0" width="50" height="{BLOCKED div $max}"  style="fill:rgb(248,241,7);stroke:rgb(0,0,0);stroke-width:0"/>  
    <rect x="310" y="0" width="50" height="{NOTRUN div $max}"  style="fill:rgb(180,180,180);stroke:rgb(0,0,0);stroke-width:0"/>  
  </g>

    <g id="ROW">
    <rect id="PASSED" x="430" y="80" width="25" height="15"  style="fill:rgb(81,223,13);stroke:rgb(0,0,0);stroke-width:1"/>
    <rect id="FAILED" x="430" y="100" width="25" height="15"  style="fill:rgb(224,12,12);stroke:rgb(0,0,0);stroke-width:1"/>
    <rect id="CAUTION" x="430" y="120" width="25" height="15"  style="fill:rgb(245,136,37);stroke:rgb(0,0,0);stroke-width:1"/>
    <rect id="BLOCKED" x="430" y="140" width="25" height="15"  style="fill:rgb(248,241,7);stroke:rgb(0,0,0);stroke-width:1"/>
    <rect id="NOTRUN" x="430" y="160" width="25" height="15"  style="fill:rgb(180,180,180);stroke:rgb(0,0,0);stroke-width:1"/>
  </g>
    <text id="PASSED-text" x="465px" y="92px"  style="fill:rgb(0,0,0);font-size:18;font-family:Arial">  
        <xsl:value-of select="PASSED"/> - Passed  </text>  
    <text id="FAILED-text" x="465px" y="112px"  style="fill:rgb(0,0,0);font-size:18;font-family:Arial">  
        <xsl:value-of select="FAILED"/> - Failed </text>  
    <text id="key3-text" x="465px" y="132px"  style="fill:rgb(0,0,0);font-size:18;font-family:Arial">  
        <xsl:value-of select="CAUTION"/> - Caution </text>  
    <text id="key4-text" x="465px" y="152px"  style="fill:rgb(0,0,0);font-size:18;font-family:Arial">  
        <xsl:value-of select="BLOCKED"/> - Blocked </text>  
    <text id="key5-text" x="465px" y="172px"  style="fill:rgb(0,0,0);font-size:18;font-family:Arial">  
        <xsl:value-of select="NOTRUN"/> - Not Run </text> 
  <g id="title">
      <text x="325px" y="20px"  style="text-anchor:middle;fill:rgb(0,0,0);font-size:24;font-family:Arial">
      <xsl:value-of select="title"/>  </text>
  </g>
 </xsl:for-each>
 </svg>
 </xsl:template>
</xsl:stylesheet>