<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cml="http://www.xml-cml.org/schema">

  <xsl:output indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/cml:unitList|/cml:cml/cml:unitList" />
  </xsl:template>

  <xsl:template match="//cml:unitList">
    <html>
      <head>
        <title>
          CML Units - <xsl:value-of select="@title" />
        </title>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        <link rel="stylesheet" href="http://www.xml-cml.org/style/cml-dict.css" type="text/css" />
      </head>

      <body>
        <div class="head">
          <h1>
            <xsl:value-of select="@title" />
          </h1>

          <h2>Namespace</h2>
          <p>
            The namespace of this dictionary is: <code>
              <xsl:value-of select="@namespace" />
            </code>
          </p>

          <xsl:if test="cml:description">
            <h2>Description</h2>
            <div>
              <xsl:copy-of select="cml:description"/>
            </div>
          </xsl:if>

          <hr />
        </div>

        <h1>Table of Contents</h1>

        <ul>
          <xsl:for-each select="./cml:unit">
            <li>
              <a href="#{@id}">
                <xsl:value-of select="@symbol" />
              </a> (<xsl:value-of select="@title" />)
            </li>
          </xsl:for-each>
        </ul>

        <hr />

        <xsl:apply-templates select="./cml:unit"/>

      </body>
    </html>

  </xsl:template>

  <xsl:template match="//cml:unit">

    <div class="entry">

      <h1 title="{@id}">
        <a name="{@id}">
          <xsl:value-of select="@symbol"/>
        </a> (<xsl:value-of select="@title" />)
      </h1>

      <xsl:if test="cml:definition">
        <h2>Definition</h2>
        <div>
          <xsl:copy-of select="cml:definition"/>
        </div>
      </xsl:if>
      <xsl:if test="cml:description">
        <h2>Description</h2>
        <div>
          <xsl:copy-of select="cml:description"/>
        </div>
      </xsl:if>
      
      <xsl:if test="@unitType">
        <h2>Unit Type</h2>
        <p>
          <em>
            <xsl:value-of select="@term"/>
          </em> has unit type <code>
            <xsl:value-of select="@unitType"/>
          </code>
        </p>
      </xsl:if>
      <xsl:if test="@parentSI">
        <h2>Parent SI</h2>
        <p>
          <em>
            <xsl:value-of select="@symbol"/>
          </em> has parent SI of <code>
            <xsl:value-of select="@parentSI"/>
          </code>
        </p>
      </xsl:if>
      <xsl:if test="@multiplierToSI">
        <h2>Multiplier to SI</h2>
        <p>
          <em>
            <xsl:value-of select="@symbol"/>
          </em> has multiplier to SI of <code>
            <xsl:value-of select="@multiplierToSI"/>
          </code>
        </p>
      </xsl:if>

      <xsl:if test="@constantToSI">
        <h2>Constant to SI</h2>
        <p>
          <em>
            <xsl:value-of select="@symbol"/>
          </em> has constant to SI of <code>
            <xsl:value-of select="@constantToSI"/>
          </code>
        </p>
      </xsl:if>

      <hr />

    </div>

  </xsl:template>

</xsl:stylesheet>