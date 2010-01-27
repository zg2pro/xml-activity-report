<?xml version="1.0" encoding="utf-8"?>

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

  <xsl:template match="dataSet">
    <svg width="600px" height="400px" xmlns="http://www.w3.org/2000/svg">
      <g id="bar" transform="translate(0,200)">
        <xsl:for-each select="bar">
          <xsl:variable name="val" select="value"/>
          <rect x="{position()*60}" y="-{$val*20}" height="{$val*20}" width="30" style="fill:{@fill};"/>
          <text x="{position()*60 + 7}" y="0" style="font-family:arial;text-anchor:middle;baseline-shift:-15;">
            <xsl:value-of select="desc"/>
          </text>
        </xsl:for-each>
      </g>
    </svg>
  </xsl:template>

</xsl:transform>