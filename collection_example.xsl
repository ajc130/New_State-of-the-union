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
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Denomination</th>
                        <th>Date</th>
                    </tr>
                    <xsl:apply-templates select="$speeches/speech">
                        <xsl:sort select="substring-after(meta/date,',')"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:apply-templates select="meta"/>
    </xsl:template>
    <xsl:template match="meta">
        <xsl:message select="date"/>
        <tr>
            <xsl:apply-templates select="name,den,date"/>
        </tr>
    </xsl:template>
    <xsl:template match="*">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
</xsl:stylesheet>
