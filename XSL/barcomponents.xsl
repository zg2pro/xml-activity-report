<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2001/XInclude">


<xsl:template match="components">
	<dataSet>
		<bar fill="rgb(100,100,100)">
			<desc>COSI</desc>
			<value><xi:include href="cocoon:/Equipe?team=COSI#xpointer(//PublisNumber)" parse="xml"/></value>
		</bar>
		<bar fill="rgb(255,0,0)">
			<desc>IMS</desc>
			<value><xi:include href="cocoon:/Equipe?team=IMS#xpointer(//PublisNumber)" parse="xml"/></value>
		</bar>
		<bar fill="rgb(0,255,0)">
			<desc>INCA</desc>
			<value><xi:include href="cocoon:/Equipe?team=INCA#xpointer(//PublisNumber)" parse="xml"/></value>
		</bar>
		<bar fill="rgb(0,0,255)">
			<desc>INCOD</desc>
			<value><xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//PublisNumber)" parse="xml"/></value>
		</bar>
	</dataSet>
  </xsl:template>

</xsl:stylesheet>