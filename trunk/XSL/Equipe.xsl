<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:param name="team"/>

  <xsl:template match="Report">
    <html>
      <head>
        <title><xsl:value-of select="Title"/></title>
        <link rel="stylesheet" href="CSS/normal.css" type="text/css"/>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Title">
    <H1><xsl:apply-templates/></H1>
  </xsl:template>

  <xsl:template match="Date">
    <P><xsl:apply-templates/></P>
  </xsl:template>

  <xsl:template match="StaffList">
	<StaffList>
	 <br/>Liste du Personnel :<br/>
    	<table align="center" border="2" >
	<xsl:apply-templates/>
        </table>
	</StaffList>
  </xsl:template>

  <xsl:template match="StaffNumber">
	Nombre de Personnes dans l'equipe : <StaffNumber>
	 <xsl:value-of select="nb"/>
	</StaffNumber> <br/> <br/> <br/>
</xsl:template>


  <xsl:template match="Person">
    	<tr><Person>
	<td><Pnom><xsl:value-of select="name"/></Pnom></td>
	<td><Pprenom><xsl:value-of select="firstName"/></Pprenom></td>
	<td><Pteam><xsl:value-of select="team"/></Pteam></td>
	</Person>
        </tr>
  </xsl:template>

  <xsl:template match="PubliList">
	<PubliList>
	 <br/>Liste des Publications de l'an dernier :<br/>
    	<table align="center" border="2" >
	<xsl:apply-templates/>
        </table>
	</PubliList>
  </xsl:template>

  <xsl:template match="Publi">
    	<tr><Publi>
		<td><auteur><xsl:value-of select="auteur"/></auteur></td>
		<td><titre><xsl:value-of select="titre"/></titre></td>
		<td><lieu><xsl:value-of select="lieu"/></lieu></td>
		<td><date><xsl:value-of select="date"/></date></td>
		<td><paru><xsl:value-of select="paru"/></paru></td>
	</Publi>
        </tr>
  </xsl:template>

  <xsl:template match="PubliNumber">
    	Nombres de publications pour l'an dernier : <PublisNumber>
	 <xsl:value-of select="nb"/>
	</PublisNumber>
    </xsl:template>

  <xsl:template match="TeamReport">
	<br/><br/>
	<TeamReport>
        <xsl:if test="$team='COSI'">
	<br/><br/>
	Compte-rendu d'activité : 
	<br/>Etabli par : <xi:include href="XML/COSIReport.xml#xpointer(//FirstName)" parse="xml"/>  <xi:include href="XML/COSIReport.xml#xpointer(//LastName)" parse="xml"/><br/>
        <br/>Commentaires : <xi:include href="XML/COSIReport.xml#xpointer(//Comments)" parse="xml"/>
        <br/>Perspectives : <xi:include href="XML/COSIReport.xml#xpointer(//Plans)" parse="xml"/>
        <br/>Besoins de l'equipe : <xi:include href="XML/COSIReport.xml#xpointer(//Needs)" parse="xml"/>
        </xsl:if>
        <xsl:if test="$team='IMS'">
	<br/><br/>
	Compte-rendu d'activité : 
	<br/>Etabli par : <xi:include href="XML/IMSReport.xml#xpointer(//FirstName)" parse="xml"/>  <xi:include href="XML/IMSReport.xml#xpointer(//LastName)" parse="xml"/><br/>
        <br/>Commentaires : <xi:include href="XML/IMSReport.xml#xpointer(//Comments)" parse="xml"/>
        <br/>Perspectives : <xi:include href="XML/IMSReport.xml#xpointer(//Plans)" parse="xml"/>
        <br/>Besoins de l'equipe : <xi:include href="XML/IMSReport.xml#xpointer(//Needs)" parse="xml"/>
        </xsl:if>
        <xsl:if test="$team='INCA'">
	<br/><br/>
	Compte-rendu d'activité : 
	<br/>Etabli par : <xi:include href="XML/INCAReport.xml#xpointer(//FirstName)" parse="xml"/>  <xi:include href="XML/INCAReport.xml#xpointer(//LastName)" parse="xml"/><br/>
        <br/>Commentaires : <xi:include href="XML/INCAReport.xml#xpointer(//Comments)" parse="xml"/>
        <br/>Perspectives : <xi:include href="XML/INCAReport.xml#xpointer(//Plans)" parse="xml"/>
        <br/>Besoins de l'equipe : <xi:include href="XML/INCAReport.xml#xpointer(//Needs)" parse="xml"/>
        </xsl:if>
        <xsl:if test="$team='INCOD'">
	<br/><br/>
	Compte-rendu d'activité : 
	<br/>Etabli par : <xi:include href="XML/INCODReport.xml#xpointer(//FirstName)" parse="xml"/>  <xi:include href="XML/INCODReport.xml#xpointer(//LastName)" parse="xml"/><br/>
        <br/>Commentaires : <xi:include href="XML/INCODReport.xml#xpointer(//Comments)" parse="xml"/>
        <br/>Perspectives : <xi:include href="XML/INCODReport.xml#xpointer(//Plans)" parse="xml"/>
        <br/>Besoins de l'equipe : <xi:include href="XML/INCODReport.xml#xpointer(//Needs)" parse="xml"/>
        </xsl:if>
	</TeamReport>
    </xsl:template>

</xsl:stylesheet>
