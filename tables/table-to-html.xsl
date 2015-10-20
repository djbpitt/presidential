<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Table games</title>
                <style type="text/css">
                    table,
                    td,
                    td,
                    th{
                        border:2px solid red;
                    }</style>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    <xsl:template match="table/*">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    <xsl:template match="table/*/*">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
</xsl:stylesheet>
