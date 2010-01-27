<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2001/XInclude">


<xsl:template match="components">
	<components>
		<component name="COSI">
			<xi:include href="cocoon:/Equipe?team=COSI#xpointer(//StaffNumber)" parse="xml"/></component>
		<component name="IMS">
			<xi:include href="cocoon:/Equipe?team=IMS#xpointer(//StaffNumber)" parse="xml"/></component>
		<component name="INCA">
			<xi:include href="cocoon:/Equipe?team=INCA#xpointer(//StaffNumber)" parse="xml"/></component>
		<component name="INCOD">
			<xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//StaffNumber)" parse="xml"/></component>
	</components>    
  </xsl:template>



</xsl:stylesheet>


