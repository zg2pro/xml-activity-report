  <xsl:stylesheet version="1.0" 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
     xmlns:java="http://xml.apache.org/xslt/java"
     xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output method="svg"/>

<xsl:template match="/">
     <xsl:apply-templates select="components"/>
</xsl:template>

<xsl:template match="components">
     <svg width="480" height="480" viewBox="0 0 500 500">
     <xsl:variable name="total" select="sum(component)"/>
     <xsl:for-each select="component">
          <xsl:variable name="color">
               <xsl:choose>
                    <xsl:when test="(position() = 1)">
                         <xsl:text>lightSalmon</xsl:text>
                    </xsl:when>
                    <xsl:when test="(position() = 2)">
                         <xsl:text>lightCyan</xsl:text>
                    </xsl:when>
                    <xsl:when test="(position() = 3 or position() = 8 or position() = 13 or position() = 18)">
                         <xsl:text>mistyRose</xsl:text>
                    </xsl:when>
                    <xsl:when test="(position() = 4 or position() = 9 or position() = 14 or position() = 19)">
                         <xsl:text>gold</xsl:text>
                    </xsl:when>
                    <xsl:when test="(position() = 5 or position() = 10 or position() = 15 or position() = 20)">
                         <xsl:text>tan</xsl:text>
                    </xsl:when>
                    <xsl:when test="(position() = 6 or position() = 11 or position() = 16)">
                         <xsl:text>lightGreen</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                         <xsl:text>lightSteelBlue</xsl:text>
                    </xsl:otherwise>
               </xsl:choose>
          </xsl:variable>

  <xsl:variable name="position" select="position()"/>
          
          <xsl:apply-templates select=".">
               <xsl:with-param name="color" select="$color"/>
               <xsl:with-param name="total" select="$total"/>
               <xsl:with-param name="runningTotal" select = "sum(preceding-sibling::component)"/>
          </xsl:apply-templates>

          <xsl:apply-templates select="." mode="legend">
               <xsl:with-param name="color" select="$color"/>
               <xsl:with-param name="offset" select="90 + ($position * 20)"/>
          </xsl:apply-templates>

     </xsl:for-each>
     </svg>
</xsl:template>

<xsl:template match="component">
     <xsl:param name="color" select="'indianRed'"/>
     <xsl:param name="total" select="'0'"/>
     <xsl:param name="runningTotal" select="'0'"/>
     <xsl:variable name="number" select="."/>
     <xsl:variable name="currentAngle"
          select="java:java.lang.Math.toRadians(($number div $total) * 360.0)"/>
     <xsl:variable name="halfAngle"
          select="java:java.lang.Math.toRadians((($number div 2) div $total) * 360.0)"/>
     <xsl:variable name="rotation" select="270 + (360.0 * ($runningTotal div $total))"/>
     <xsl:variable name="x1" select="java:java.lang.Math.cos($halfAngle) * 70"/>
     <xsl:variable name="y1" select="java:java.lang.Math.sin($halfAngle) * 70"/>
     <xsl:variable name="cosTheta" 
          select="java:java.lang.Math.cos(java:java.lang.Math.toRadians($rotation))"/>
     <xsl:variable name="sinTheta" 
          select="java:java.lang.Math.sin(java:java.lang.Math.toRadians($rotation))"/>
  <path style="fill:{$color};stroke:black;stroke-width:1;
          fillrule:evenodd;stroke-linejoin:bevel;">
          <xsl:attribute name="transform">
               <xsl:text>translate(150,150)</xsl:text> <!--centering the circle in the non-legend space-->
               <xsl:text>rotate(</xsl:text>
               <xsl:value-of select="$rotation"/>
               <xsl:text>)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="d">
               <xsl:text>M 100 0 A 100 100 0 </xsl:text> <!-- to change size, change all instances of 100-->
                    <xsl:choose>
                         <xsl:when test="$currentAngle > 3.14">
                              <xsl:text>1 </xsl:text>
                         </xsl:when>
                         <xsl:otherwise>
                              <xsl:text>0 </xsl:text>
                         </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>1 </xsl:text>
                    <xsl:value-of select="java:java.lang.Math.cos($currentAngle) * 100"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="java:java.lang.Math.sin($currentAngle) * 100"/>
                    <xsl:text> L 0 0 Z</xsl:text>
               </xsl:attribute>
          </path>
 <text style="text-anchor:middle">
          <xsl:attribute name="transform">
               <xsl:text>translate(150,150) </xsl:text> 
          </xsl:attribute>
          <xsl:attribute name="x">
               <xsl:value-of select="($x1 * $cosTheta) - ($y1 * $sinTheta)"/>
          </xsl:attribute>
          <xsl:attribute name="y">
               <xsl:value-of select="($x1 * $sinTheta) + ($y1 * $cosTheta)"/>
          </xsl:attribute>
          <xsl:value-of select="round(100 * ($number div $total))"/>
          <xsl:text>%</xsl:text>
     </text>
</xsl:template>

<xsl:template match="component" mode="legend">
     <xsl:param name="color" select="'indianRed'"/>
     <xsl:param name="offset" select="'0'"/>
     <text>
          <xsl:attribute name="style">
               <xsl:text>font-size:12; text-anchor:start</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="x">
               <xsl:text>320</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="y">
               <xsl:value-of select="$offset"/>
          </xsl:attribute>
          <xsl:value-of select="@name"/>
          <xsl:text> (</xsl:text>
          <xsl:value-of select="."/>
          <xsl:text>) </xsl:text>
     </text>
     <path>
          <xsl:attribute name="style">
               <xsl:text>stroke:black; stroke-width:1; fill:</xsl:text>
               <xsl:value-of select="$color"/>
          </xsl:attribute>
          <xsl:attribute name="d">
               <xsl:text>M 290 </xsl:text>
               <xsl:value-of select="$offset - 10"/>
               <xsl:text> L 290 </xsl:text>
               <xsl:value-of select="$offset"/>
               <xsl:text> L 300 </xsl:text>
               <xsl:value-of select="$offset"/>
               <xsl:text> L 300 </xsl:text>
               <xsl:value-of select="$offset - 10"/>
               <xsl:text> Z</xsl:text>
          </xsl:attribute>
     </path>
</xsl:template>

</xsl:stylesheet>

