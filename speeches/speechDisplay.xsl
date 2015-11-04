<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"> 
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head><title>Presidential Speeches</title></head>
            <body>
                <h1><xsl:apply-templates select="//author"/></h1>
                <h2>
                    <xsl:apply-templates select="//title"/>
                    <xsl:text>  :  </xsl:text>
                    <xsl:apply-templates select="//when"/>
                </h2>
                <hr />
                <p><xsl:apply-templates select="//p"/><br/></p>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
