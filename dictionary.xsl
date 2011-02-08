<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml" xmlns:cml="http://www.xml-cml.org/schema">

<xsl:output indent="yes"/>

<xsl:template match="/">
    <xsl:apply-templates select="//cml:dictionary" />
</xsl:template>

<xsl:template match="//cml:dictionary">
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CML Dictionary - <xsl:value-of select="@title" /></title>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <link rel="stylesheet" href="./css/W3C-PR.css" type="text/css" />
    <link rel="stylesheet" href="./css/cml-dict.css" type="text/css" />
</head>

<body>
<div class="head">
    <h1><xsl:value-of select="@title" /></h1>

    <h2>Namespace</h2>
    <p>The namespace of this dictionary is: <code><xsl:value-of select="@namespace" /></code></p>

<xsl:if test="@dictionaryPrefix">
    <h2>Default Prefix</h2>
    <p>The default prefix for this dictionary is: <code><xsl:value-of select="@dictionaryPrefix" /></code></p>
</xsl:if>

<xsl:if test="cml:description">
    <h2>Description</h2>
    <div><xsl:copy-of select="cml:description"/></div>
</xsl:if>

    <hr />
</div>

<h1>Table of Contents</h1>

<ul>
<xsl:for-each select="//cml:dictionary/cml:entry">
    <li><a href="#{@id}"><xsl:value-of select="@term" /></a></li>
</xsl:for-each>
</ul>

<hr />

<xsl:apply-templates select="//cml:dictionary/cml:entry"/>

</body>
</html>
</xsl:template>

<xsl:template match="//cml:dictionary/cml:entry">
    <html:h1><html:a name="{@id}"><xsl:value-of select="@term"/></html:a></html:h1>

<xsl:if test="cml:definition">
    <html:h2>Definition</html:h2>
    <html:div><xsl:copy-of select="cml:definition"/></html:div>
</xsl:if>
<xsl:if test="cml:description">
    <html:h2>Description</html:h2>
    <html:div><xsl:copy-of select="cml:description"/></html:div>
</xsl:if>
<xsl:if test="@dataType">
    <html:h2>Data Type</html:h2>
    <html:p><html:em><xsl:value-of select="@term"/></html:em> is of data type <html:code><xsl:value-of select="@dataType"/></html:code></html:p>
</xsl:if>
<xsl:if test="@unitType">
    <html:h2>Unit Type</html:h2>
    <html:p><html:em><xsl:value-of select="@term"/></html:em> has unit type <xsl:value-of select="@unitType"/></html:p>
</xsl:if>
<xsl:if test="@unit">
    <html:h2>Default units</html:h2>
    <html:p><html:em><xsl:value-of select="@term"/></html:em> has default units <xsl:value-of select="@unit"/></html:p>
</xsl:if>
    <html:hr />
</xsl:template>

</xsl:stylesheet>