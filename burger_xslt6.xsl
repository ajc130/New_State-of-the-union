<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="speech">
        <html>
            <head>
                <title>Barack Obama's 2nd Inaugural Speech</title>
                <link rel="stylesheet" type="text/css" href="burger_obama.css"/>
            </head>
            <body>
                
                <h1><xsl:apply-templates select="meta/title"/></h1>
                <h2><xsl:apply-templates select="meta/date"/></h2>
                <div class="menu">
                <ul>
                    <xsl:apply-templates select="//reference" mode="top"/>
                </ul>
                </div>
                <hr/>
                <xsl:apply-templates select="body"/>
                    
            </body>
        </html>    
    </xsl:template>
    
    <xsl:template match="reference" mode="top">
        <li mode="top"><a href="#reference{count(preceding::reference)+1}"><xsl:value-of select ="local-name()"/>&#160;<xsl:value-of select="(count(preceding::reference)+1)"/></a></li>
        
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="reference">
        <reference id="reference{count(preceding::reference) + 1}"><xsl:apply-templates/></reference>
        
    </xsl:template>
</xsl:stylesheet>