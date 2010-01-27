<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:param name="test_param"/>

  <xsl:template match="Report">
    <html>
      <head>
        <title><xsl:value-of select="Title"/></title>
        <link rel="stylesheet" href="CSS/normal.css" type="text/css"/>
      </head>
<br/>
      <body>
        <xsl:apply-templates/>
	<br/>
	<a href="http:/cocoon/~portable/Labo.pdf">Generer un PDF pour l'impression du Rapport.</a>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="equipes">
	<big>Table des matières : </big><br/>
	<a href="#lst">I Liste du personnel de chaque équipe</a><br/>
	<a href="#diag">II Repartition des effectifs (diagramme en secteurs)</a><br/>
	<a href="#pub">III Publications produites depuis l'an dernier</a><br/>
	<a href="#diag2">IV Représentation de production de publications (diagramme en barres) </a><br/>
<a name="lst"><br/></a>
Personnel <a href="http:/cocoon/~portable/Equipe?team=COSI">COSI</a> :
<xi:include href="cocoon:/Equipe?team=COSI#xpointer(//StaffList)" parse="xml"/><br/>
Effectif : <xi:include href="cocoon:/Equipe?team=COSI#xpointer(//StaffNumber)" parse="xml"/><br/><br/><br/>
Personnel  <a href="http:/cocoon/~portable/Equipe?team=IMS">IMS</a> :
<xi:include href="cocoon:/Equipe?team=IMS#xpointer(//StaffList)" parse="xml"/><br/>
Effectif : <xi:include href="cocoon:/Equipe?team=IMS#xpointer(//StaffNumber)" parse="xml"/><br/><br/><br/>
Personnel  <a href="http:/cocoon/~portable/Equipe?team=INCA">INCA</a> :
<xi:include href="cocoon:/Equipe?team=INCA#xpointer(//StaffList)" parse="xml"/><br/>
Effectif : <xi:include href="cocoon:/Equipe?team=INCA#xpointer(//StaffNumber)" parse="xml"/><br/><br/><br/>
Personnel  <a href="http:/cocoon/~portable/Equipe?team=INCOD">INCOD</a> :
<xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//StaffList)" parse="xml"/><br/>
Effectif : <xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//StaffNumber)" parse="xml"/><br/><br/><br/>
  </xsl:template>

 <xsl:template match="piechart">
 <br/> <br/><a name="diag"><br/></a> Diagramme en secteurs de la repartition des effectifs <br/> <br/>
<embed src="pie" width="500" height="500" type="image/svg+xml"/>
</xsl:template>

 <xsl:template match="publis">
<br/><a name="pub"><br/></a>
publications récentes de <a href="http:/cocoon/~portable/Equipe?team=COSI">COSI</a> :
<xi:include href="cocoon:/Equipe?team=COSI#xpointer(//PubliList)" parse="xml"/><br/>
nombre de publications : <xi:include href="cocoon:/Equipe?team=COSI#xpointer(//PublisNumber)" parse="xml"/><br/><br/><br/>
publications récentes de <a href="http:/cocoon/~portable/Equipe?team=IMS">IMS</a> :
<xi:include href="cocoon:/Equipe?team=IMS#xpointer(//PubliList)" parse="xml"/><br/>
nombre de publications : <xi:include href="cocoon:/Equipe?team=IMS#xpointer(//PublisNumber)" parse="xml"/><br/><br/><br/>
publications récentes de <a href="http:/cocoon/~portable/Equipe?team=INCA">INCA</a> :
<xi:include href="cocoon:/Equipe?team=INCA#xpointer(//PubliList)" parse="xml"/><br/>
nombre de publications : <xi:include href="cocoon:/Equipe?team=INCA#xpointer(//PublisNumber)" parse="xml"/><br/><br/><br/>
publications récentes de <a href="http:/cocoon/~portable/Equipe?team=INCOD">INCOD</a> :
<xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//PubliList)" parse="xml"/><br/>
nombre de publications : <xi:include href="cocoon:/Equipe?team=INCOD#xpointer(//PublisNumber)" parse="xml"/><br/><br/><br/>
</xsl:template>

 <xsl:template match="barchart">
 <br/> <br/><a name="diag2"><br/></a> Diagramme en barres de la production de publications <br/> <br/>
<embed src="bars" width="620" height="420" type="image/svg+xml"/>
</xsl:template>

  <xsl:template match="Title">
    <H1><xsl:apply-templates/></H1>
  </xsl:template>

  <xsl:template match="Date">
    <P><xsl:apply-templates/></P>
  </xsl:template>



</xsl:stylesheet>
