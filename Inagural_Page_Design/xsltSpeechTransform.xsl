<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <apply-templates select="//meta/title" mode="title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="inaugural.css"/>
                <script type="text/javascript" src="inaugural.js">/**/</script>
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
                <div id="infobox">

                    <xsl:apply-templates select="//reference" mode="infobox"/>

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
        <caption>
            <xsl:apply-templates select="//meta/name"/>
        </caption>
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

    <xsl:template match="god">
        <xsl:choose>
            <xsl:when test="style='poetic'">
                <span class="poetic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="style='name'">
                <span class="name">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="style='Jesus'">
                <span class="Jesus">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="style='pronoun'">
                <span class="pronoun">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="style='title'">
                <span class="title">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="reference" mode="infobox">
        <div class="reference">
            <h3>Reference <xsl:value-of select="(count(preceding::reference)+1)"/></h3>
            <p>"<xsl:value-of select="reference"/>..."</p>
            <h4>
                <u>Category:</u>
            </h4>
            <h4>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@category"/>
                        <xsl:text>.html</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@category"/>
                </a>
            </h4>
        </div>
    </xsl:template>

</xsl:stylesheet>
