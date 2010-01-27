
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="H1">
  <fo:block font-size="14pt" font-family="sans-serif"
      font-weight="bold" color="green"
      space-before="6pt" space-after="6pt">
  <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="P">
  <fo:block
      text-indent="1em"
      font-family="sans-serif" font-size="12pt"
      space-before.minimum="2pt"
      space-before.maximum="6pt"
      space-before.optimum="4pt"
      space-after.minimum="2pt"
      space-after.maximum="6pt"
      space-after.optimum="4pt">
  <xsl:apply-templates/>
  </fo:block>
</xsl:template>


</xsl:stylesheet>
