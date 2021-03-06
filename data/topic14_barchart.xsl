<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="wcInaugSum" select="sum(//item[type = 'Inaug']/wc)"/>
    <xsl:variable name="wcSotuSum" select="sum(//item[type = 'sotu']/wc)"/>
    <xsl:variable name="yInaugWP"
        select="sum(//item[type = 'Inaug']/(sum(topic[(@n = '1') or (@n = '3') or (@n = '4') or (@n = '13')]/@perc) * wc)) div $wcInaugSum"/>
    <xsl:variable name="yInaugEcon"
        select="sum(//item[type = 'Inaug']/(sum(topic[(@n = '7') or (@n = '8') or (@n = '10')]/@perc) * wc)) div $wcInaugSum"/>
    <xsl:variable name="yInaugLaw"
        select="sum(//item[type = 'Inaug']/(sum(topic[(@n = '6') or (@n = '9') or (@n = '12')]/@perc) * wc)) div $wcInaugSum"/>
    <xsl:variable name="yInaugSov"
        select="sum(//item[type = 'Inaug']/(sum(topic[(@n = '0') or (@n = '5') or (@n = '11')]/@perc) * wc)) div $wcInaugSum"/>
    <xsl:variable name="ySotuWP"
        select="sum(//item[type = 'sotu']/(sum(topic[(@n = '1') or (@n = '3') or (@n = '4') or (@n = '13')]/@perc) * wc)) div $wcSotuSum"/>
    <xsl:variable name="ySotuEcon"
        select="sum(//item[type = 'sotu']/(sum(topic[(@n = '7') or (@n = '8') or (@n = '10')]/@perc) * wc)) div $wcSotuSum"/>
    <xsl:variable name="ySotuLaw"
        select="sum(//item[type = 'sotu']/(sum(topic[(@n = '6') or (@n = '9') or (@n = '12')]/@perc) * wc)) div $wcSotuSum"/>
    <xsl:variable name="ySotuSov"
        select="sum(//item[type = 'sotu']/(sum(topic[(@n = '0') or (@n = '5') or (@n = '11')]/@perc) * wc)) div $wcSotuSum"/>
    <xsl:decimal-format name="twoDec" decimal-separator="."/>
    <xsl:template match="/">
        <svg width="1000" height="300" viewBox="0 0 1000 300" preserveAspectRatio="xMinYMin meet">
            <g transform="translate(50, 300), scale(3.5, 3.5)">
                <!-- grid lines -->
                <xsl:for-each select="1 to 6">
                    <xsl:variable name="gridY" select=". * -10"/>
                    <line x1="20" y1="{$gridY -10}" x2="215" y2="{$gridY -10}" stroke="#ecf0fc"
                        stroke-width="0.1" stroke-dasharray="7,4"/>
                </xsl:for-each>
                <!-- Inaug bars -->
                <rect x="{20+15}" y="-{$yInaugWP * 100 +10}" height="{$yInaugWP * 100}" width="15"
                    fill="#6600cc" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{20+17}" y="-{$yInaugWP * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($yInaugWP * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{20+60}" y="-{$yInaugEcon * 100 +10}" height="{$yInaugEcon * 100}"
                    width="15" fill="#6600cc" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{20+62}" y="-{$yInaugEcon * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($yInaugEcon * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{20+105}" y="-{$yInaugLaw * 100 + 10}" height="{$yInaugLaw * 100}"
                    width="15" fill="#6600cc" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{20+107}" y="-{$yInaugLaw * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($yInaugLaw * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{20+150}" y="-{$yInaugSov * 100 + 10}" height="{$yInaugSov * 100}"
                    width="15" fill="#6600cc" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{20+152}" y="-{$yInaugSov * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($yInaugSov * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <!-- Sotu bars -->
                <rect x="{35+15+0.4}" y="-{$ySotuWP * 100 +10}" height="{$ySotuWP * 100}" width="15"
                    fill="#cc6600" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{35+17.4}" y="-{$ySotuWP * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($ySotuWP * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{35+60+0.4}" y="-{$ySotuEcon * 100 +10}" height="{$ySotuEcon * 100}" width="15"
                    fill="#cc6600" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{35+62.4}" y="-{$ySotuEcon * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($ySotuEcon * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{35+105+0.4}" y="-{$ySotuLaw * 100 +10}" height="{$ySotuLaw * 100}" width="15"
                    fill="#cc6600" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{35+107.4}" y="-{$ySotuLaw * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($ySotuLaw * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <rect x="{35+150+0.4}" y="-{$ySotuSov * 100 +10}" height="{$ySotuSov * 100}" width="15"
                    fill="#cc6600" stroke-width="0.2" stroke="black"/>
                <text text-anchor="start" x="{35+152.4}" y="-{$ySotuSov * 100 +12}" fill="black"
                    font-size="25%">
                    <xsl:value-of select="format-number(($ySotuSov * 100), '##.##', 'twoDec')"/>
                    <xsl:text>%</xsl:text>
                </text>
                <!-- y-axis -->
                <line x1="20" x2="20" y1="-10" y2="-70" stroke="black" stroke-width="0.5"/>
                <!-- grid line label -->
                <text text-anchor="middle" x="{10}" y="{-17}" font-size="33%">10%</text>
                <text text-anchor="middle" x="{10}" y="{-27}" font-size="33%">20%</text>
                <text text-anchor="middle" x="{10}" y="{-37}" font-size="33%">30%</text>
                <text text-anchor="middle" x="{10}" y="{-47}" font-size="33%">40%</text>
                <text text-anchor="middle" x="{10}" y="{-57}" font-size="33%">50%</text>
                <text text-anchor="middle" x="{10}" y="{-67}" font-size="33%">60%</text>
                <!-- x-axis -->
                <line x1="20" x2="215" y1="-10" y2="-10" stroke="black" stroke-width="0.5"/>
                <!-- x-axis label -->
                <text text-anchor="middle" x="{20 + 30}" y="-5" font-size="33%">War/Peace</text>
                <text text-anchor="middle" x="{20 + 75}" y="-5" font-size="33%">Economy</text>
                <text text-anchor="middle" x="{20 + 120}" y="-5" font-size="33%">Law</text>
                <text text-anchor="middle" x="{20 + 165}" y="-5" font-size="33%">Sovereignty</text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
