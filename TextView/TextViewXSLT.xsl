<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="speeches" select="collection('Marked_Up_Speeches/?select=*.xml')"
        as="document-node()+"/>
    <xsl:template name="main">
        <html>
            <head>
                <title>Presidential information</title>
            </head>
            <body>
                <h1>The Inaugural Addresses</h1>
                <ol>
                    <xsl:apply-templates select="$speeches/speech"/>     
                </ol>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="speech">
        <li>
            <xsl:attribute name="class">
                <xsl:value-of select="meta" />
            </xsl:attribute>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="concat(substring-before(tokenize(base-uri(.),'/')[last()],'.xml'),'.html')"/>
                </xsl:attribute>
                <xsl:apply-templates select="meta/title"/></a>
        </li> 
    </xsl:template>
    <xsl:template match="meta">
            <xsl:apply-templates select="name,den,class,kids,married,state,party,age,profession,term,title,date"/>
      </xsl:template> 
</xsl:stylesheet>
