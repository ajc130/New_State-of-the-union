<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <speeches category="total">
        <xsl:apply-templates select="//speech"/>
        </speeches>
    </xsl:template>
    <xsl:template match="speech">
        <speech>
            <xsl:attribute name="year">
                <xsl:for-each select="tokenize(string(.),' ')[1]">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:for-each select="tokenize(string(.),' ')[2]">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </speech>
        
    </xsl:template>
</xsl:stylesheet>