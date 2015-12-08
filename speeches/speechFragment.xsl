<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"> 
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
       <h2><xsl:apply-templates select="//author"/></h2>
       <h3><xsl:value-of select="concat(//title,': ',//when)"/></h3>
       <hr/>
       <xsl:apply-templates select="//body/p"/>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
</xsl:stylesheet>
