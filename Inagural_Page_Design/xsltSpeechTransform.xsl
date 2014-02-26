<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <apply-templates select="//meta/title" mode="title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="Innagural.css"/>
            </head>
            <body>
                <div id="header">
                    <p> Portrait! <br/>
                    </p>
                    <h1>I'm a smartical president type saying things.</h1>
                </div>
                <div id="bio">
                    <table border="1" rules="none" frame="box">
                        <xsl:apply-templates select="//meta"/>
                    </table>
                </div>
                <div id="main">
                    <h1>
                        <xsl:apply-templates select="//meta/title" mode="main"/>
                    </h1>
                    <h3>
                        <xsl:apply-templates select="//meta/date" mode="main"/>
                    </h3>
                   
                        <xsl:apply-templates select="//body"/>
                    
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta">
        
        <tr>
            <th>
                <xsl:apply-templates select="//meta/name"/>
            </th>
        </tr>           
        <tr>
            <td>Denomination:</td>
            <td><xsl:apply-templates select="den"/></td>
        </tr>
        <tr>
            <td>Class:</td>
            <td><xsl:apply-templates select="class"/></td>
        </tr>
        <tr>
            <td>Kids:</td>
            <td><xsl:apply-templates select="kids"/></td>
        </tr>
        <tr>
            <td>Married:</td>
            <td><xsl:apply-templates select="married"/></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><xsl:apply-templates select="state"/></td>
        </tr>
        <tr>
            <td>Party:</td>
            <td><xsl:apply-templates select="party"/></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><xsl:apply-templates select="age"/></td>
        </tr>
        <tr>
            <td>Profession:</td>
            <td><xsl:apply-templates select="profession"/></td>
        </tr>
        <tr>
            <td>Term:</td>
            <td><xsl:apply-templates select="term"/></td>
        </tr>
    </xsl:template>
  <xsl:template match="body/p">
     <p><xsl:apply-templates/></p>
  </xsl:template>
    <xsl:template match="reference">
        <span id="reference"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>
