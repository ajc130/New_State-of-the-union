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
                <link rel="stylesheet" type="text/css" href="innagural.css"/>
                <script type="text/javascript" src="speech.js">/**/</script>
                <script type="text/javascript" src="Inaugural.js">/**/</script>
            </head>
            <body>
                <div id="header">
                    <img src="Lincoln.jpg" alt="Lincoln" id="portrait"/>


                    <h1><em>"God is always right."</em>-Abraham Lincoln</h1>
                    <h2>U.S. Presidential Innagural Addresses: So Help Me God</h2>

                    <!--#include virtual="menu.html" -->
                </div>
                <div id="bio">
                    <table border="1" rules="none" frame="box">
                        <xsl:apply-templates select="//meta"/>
                    </table>
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
<div id="infobox">

                    <xsl:apply-templates select="//reference" mode="infobox"/>

                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta">
        
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
        </tr>
    </xsl:template>

    <xsl:template match="body/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="reference">
        <span class="reference">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="god[@style='poetic']">
        <span style="color:#a70a0a ;" onclick="overlay('id1','You have selected a poetic illusion to a deity. Click to learn more about poetic illusions to dieties','poetic.xhtml')">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="god[@style='pronoun']">
        <span style="color:#a70a0a ;" onclick="overlay('id1','You have selected a pronoun connected to a diety. Click to learn more about pronouns connected to dieties','pronoun.xhtml')">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="god[@style='title']">
        <span style="color:#a70a0a ;" onclick="overlay('id1','You have selected the title of a deity. Click to learn more about titles of dieties','title.xhtml')">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="god[@style='name']">
        <span style="color:#a70a0a ;" onclick="overlay('id1','You have selected a name of a deity. Click to learn more about names of dieties','name.xhtml')">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="reference" mode="infobox">
        <div class="reference">
            <h3>Reference <xsl:value-of select="(count(preceding::reference)+1)"/></h3>
            <p>"<xsl:analyze-string select="." regex="(\w+\s\w+\s\w+)\s "><xsl:matching-substring><xsl:value-of select="."/></xsl:matching-substring></xsl:analyze-string>..."</p>
            <p>
                Category:
            </p>
            <p>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@category"/>
                        <xsl:text>.html</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@category"/>
                </a>
            </p>
        </div>
    </xsl:template>

</xsl:stylesheet>
