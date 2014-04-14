<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="speeches">
        <svg><g transform="translate(50,400)">
            <line x1="0" y1="0" x2="1150" y2="0" stroke="black" stroke-width="2"/>
            <line x1="0" y1="0" y2="-500" x2="0" stroke="black" stroke-width="2"/>
            <xsl:apply-templates/>
        </g></svg>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:variable name="interval" select="10"></xsl:variable>
        <!--<xsl:variable name="year" select="@year"/>-->
            <circle cx="{(10)*(position()-1)+ $interval}" cy="-{.}" r="3.5" fill="black"/>
    </xsl:template>
</xsl:stylesheet>