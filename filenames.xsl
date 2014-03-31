<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="speeches" select="collection('Marked_Up_Speeches/?select=*.xml')"
        as="document-node()+"/>
    <xsl:template name="main">
        <xsl:message select="count($speeches)"/>
        <html>
            <head>
                <title>Presidential information</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="$speeches/speech"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="speech">
        <li>
            <xsl:value-of select="concat(substring-before(tokenize(base-uri(.),'/')[last()],'.xml'),'.html')"/>
        </li>
    </xsl:template>
</xsl:stylesheet>