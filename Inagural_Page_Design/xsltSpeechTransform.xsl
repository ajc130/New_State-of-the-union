<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <apply-templates select="//meta/title" mode="title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="Innagural.css"/>
                <script type="text/javascript" src="speech.js">/**/</script>
                <script type="text/javascript" src="Inaugural.js">/**/</script>
            </head>
            <body>
                <div id="header">
                    <img src="Lincoln.jpg" alt="Lincoln" id="portrait"/>


                    <h1><em>"God is always right."</em>-Abraham Lincoln</h1>
                    <h2>U.S. Presidential Inaugural Addresses: So Help Me God</h2>

                    <!--#include virtual="menu.html" -->
                </div>
                <div id="bio">
                    <table id="bi">
                        <xsl:apply-templates select="//meta"/>
                    </table>
                </div>
                
                
<div id="infobox">
<h5 class="box">References</h5>
                    <xsl:apply-templates select="//reference" mode="infobox"/>

                </div>
                <div id="main">
                    <h5>
                        <xsl:apply-templates select="//meta/title" mode="main"/>
                    </h5>
                    <h3>
                        <xsl:apply-templates select="//meta/date" mode="main"/>
                    </h3>
                    
                    <xsl:apply-templates select="//body"/>
                    
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta">
        <th colspan="2">Biographical Information</th>
        <tr>
            <td>Denomination:</td>
            <td>
                <xsl:apply-templates select="den"/>
            </td>
        </tr>
        <tr>
            <td>Class:</td>
            <td>
                <xsl:apply-templates select="class"/>
            </td>
        </tr>
        <tr>
            <td>Kids:</td>
            <td>
                <xsl:apply-templates select="kids"/>
            </td>
        </tr>
        <tr>
            <td>Married:</td>
            <td>
                <xsl:apply-templates select="married"/>
            </td>
        </tr>
        <tr>
            <td>State:</td>
            <td>
                <xsl:apply-templates select="state"/>
            </td>
        </tr>
        <tr>
            <td>Party:</td>
            <td>
                <xsl:apply-templates select="party"/>
            </td>
        </tr>
        <tr>
            <td>Age:</td>
            <td>
                <xsl:apply-templates select="age"/>
            </td>
        </tr>
        <tr>
            <td>Profession:</td>
            <td>
                <xsl:apply-templates select="profession"/>
            </td>
        </tr>
        <tr>
            <td>Term:</td>
            <td>
                <xsl:apply-templates select="term"/>
            </td>
        </tr></xsl:template>
        
    
 <xsl:template match="reference" mode="infobox">
        <xsl:variable name="tokenized" select="tokenize(.,'\s+')"/>
        <div class="boxy">
            <h3>
                <a href="#reference{count(preceding::reference)+1}"><xsl:text>Reference </xsl:text><xsl:value-of select="(count(preceding::reference)+1)"/>
                </a>
            </h3>
            <p>
                <q><em><xsl:value-of select="string-join($tokenized[position() lt 4],' ')"/>
                    <xsl:if test="$tokenized[3] = ('a','an','the')">
                        <xsl:value-of select="concat(' ',$tokenized[4])"/>
                    </xsl:if>...</em></q>
            </p>
            <p><xsl:text>Category: </xsl:text><a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@category"/>
                        <xsl:text>.html</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@category"/>
                </a>
            </p>
        </div>
 </xsl:template>
    <xsl:template match="body/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="reference">
        <span class="reference" id="reference{count(preceding::reference) + 1}" >
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="god[@style='poetic']">
        <a href="title.xhtml" class="titlecode">
            <xsl:apply-templates/>
            <span class="titletooltip" style="display: none;">This is a poetic reference to a deity. Click here to learn more about poetic references to deities.</span></a>
           
        
    </xsl:template>
    <xsl:template match="god[@style='pronoun']">
        <a href="title.xhtml" class="titlecode">
            <xsl:apply-templates/>
            <span class="titletooltip" style="display: none;">This is a pronoun that has a deity as its antecedent. Click here to learn more about pronouns with divine antecedents.</span></a>
        
        
    </xsl:template>
    <xsl:template match="god[@style='title']">
        <a href="title.xhtml" class="titlecode">
            <xsl:apply-templates/>
            <span class="titletooltip" style="display: none;">This is the title of a deity. Click here to learn more about divine titles.</span></a>
        
        
    </xsl:template>
    <xsl:template match="god[@style='name']">
        <a href="title.xhtml" class="titlecode">
            <xsl:apply-templates/>
            <span class="titletooltip" style="display: none;">This is the name of a deity. Click here to learn more about deity names.</span></a>
        
        
    </xsl:template>
  

</xsl:stylesheet>
