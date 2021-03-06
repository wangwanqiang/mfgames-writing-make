<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns="http://www.w3.org/1999/xhtml"
	xmlns:mbp="mobi"
    version="2.0">
  <!-- This doesn't use the standard DocBook stylesheets. Instead, it
       is just a simple conversion of a DocBook document into HTML for
       use with `kindlegen`.

       This doesn't generate a table of contents (see kindletoc for
       that) and it only generates ID fields for those elements that
       have one. -->

  <!-- `kindlegen` doesn't like the DOCTYPE. -->
  <xsl:output method="xml" />

  <!-- Include the common stylesheet -->
  <xsl:include href="style.xsl"/>

  <xsl:template match="/">
	<html>
	  <head>
		<meta http-equiv="Content-Type"
			  content="application/xhtml+xml; charset=utf-8" />
		<title>Table of Contents</title>

		<!-- Add in the stylesheet -->
		<xsl:apply-templates select="." mode="css-style"/>
	  </head>
	  <body>
		<h1>Table of Contents</h1>

		<xsl:apply-templates>
		  <xsl:with-param name="depth">0</xsl:with-param>
		</xsl:apply-templates>
	  </body>
	</html>
  </xsl:template>

  <!-- TOC Entries -->
  <xsl:template match="d:book|d:chapter|d:article|d:section|d:appendix">
	<xsl:param name="depth"/>

    <!-- Include the name of the article as a heading 1. -->	
	<p>
	  <xsl:choose>
		<xsl:when test="number($depth) = 1">
		  <xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
		</xsl:when>
		<xsl:when test="number($depth) = 2">
		  <xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
		</xsl:when>
	  </xsl:choose>

	  <a href="content.html#{@id}">
		<xsl:apply-templates select="d:info/d:title"/>
	  </a>
	</p>

	<!-- Include the rest of the items. -->
	<xsl:apply-templates select="d:chapter|d:article|d:section">
	  <xsl:with-param name="depth">
		<xsl:value-of select="number($depth) + 1"/>
	  </xsl:with-param>
	</xsl:apply-templates>

	<xsl:apply-templates select="d:appendix|d:colophon">
	  <xsl:with-param name="depth">
		<xsl:value-of select="number($depth)"/>
	  </xsl:with-param>
	</xsl:apply-templates>
  </xsl:template>

  <xsl:template match="d:colophon">
	<p><a href="content.html#colophon">Colophon</a></p>
  </xsl:template>

  <xsl:template match="d:dedication">
	<p>Dedication</p>
  </xsl:template>

  <xsl:template match="d:acknowledgment">
	<p>Acknowledgment</p>
  </xsl:template>

  <!-- Structural Elements -->
  <xsl:template match="*" priority="-1" />

  <!-- Info -->
  <xsl:template match="d:title">
	<xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
