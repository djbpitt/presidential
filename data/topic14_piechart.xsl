<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" 
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="Sum" select="sum(//item[author = 'BO']/wc)"/>
    <xsl:variable name="WP"
        select="sum(//item[author = 'BO']/(sum(topic[(@n = '1') or (@n = '3') or (@n = '4') or (@n = '13')]/@perc) * wc)) div $Sum"/>
    <xsl:variable name="Econ"
        select="sum(//item[author = 'BO']/(sum(topic[(@n = '7') or (@n = '8') or (@n = '10')]/@perc) * wc)) div $Sum"/>
    <xsl:variable name="Law"
        select="sum(//item[author = 'BO']/(sum(topic[(@n = '6') or (@n = '9') or (@n = '12')]/@perc) * wc)) div $Sum"/>
    <xsl:variable name="Sov"
        select="sum(//item[author = 'BO']/(sum(topic[(@n = '0') or (@n = '5') or (@n = '11')]/@perc) * wc)) div $Sum"/>
    <xsl:decimal-format name="twoDec" decimal-separator="."/>
    <xsl:template match="/">
        <svg width="500" height="350" viewBox="0 0 500 350" preserveAspectRatio="xMinYMin meet">
            <g transform="translate(175, 175), scale(1.5, 1.5)">
                <!-- the whole pie -->
                <circle r="100" cx="0" cy="0" fill="lightgray"/>
                <!-- Every Topic -->
                <path d="M0,0 L100,0 A100,100 0 1,1 {($WP + $Econ + $Law + $Sov)},{($WP + $Econ + $Law + $Sov)} Z" style="fill:#ff9900; stroke:black; stroke-width:1"/>
                <!-- Minus Sov -->
                <path d="M0,0 L100,0 A100,100 0 1,1 {($WP + $Econ + $Law)},{($WP + $Econ + $Law)} Z" style="fill:#00ff99; stroke:black; stroke-width:1"/>
                <!-- Minus Sov and Law -->
                <path d="M0,0 L100,0 A100,100 0 1,1 {($WP + $Econ )},{($WP + $Econ)} Z" style="fill:#9900ff; stroke:black; stroke-width:1"/>
                <!-- Minus Sov Law Econ -->
                <path d="M0,0 L100,0 A100,100 0 1,1 {($WP)},{($WP)} Z" style="fill:#e6ff00; stroke:black; stroke-width:1"/>
                <!-- % labels -->
                <text text-anchor="start" x="{120}" y="{-75}" fill="black" font-size="60%">Obama</text>
                <text text-anchor="start" x="{120}" y="-{60}" fill="#e6ff00"
                    font-size="50%">
                    <xsl:text>War/Peace: </xsl:text>
                    <xsl:value-of select="format-number(($WP * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <text text-anchor="start" x="{120}" y="-{50}" fill="#9900ff"
                    font-size="50%">
                    <xsl:text>Economy: </xsl:text>
                    <xsl:value-of select="format-number(($Econ * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <text text-anchor="start" x="{120}" y="-{40}" fill="#00ff99"
                    font-size="50%">
                    <xsl:text>Law: </xsl:text>
                    <xsl:value-of select="format-number(($Law * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <text text-anchor="start" x="{120}" y="-{30}" fill="#ff9900"
                    font-size="50%">
                    <xsl:text>Sovereignty: </xsl:text>
                    <xsl:value-of select="format-number(($Sov * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
