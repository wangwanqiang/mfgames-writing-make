<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
  <xsl:template match="d:*" mode="pagestyle">
    <xsl:text>\makepagestyle{custompage}</xsl:text>

    <xsl:text>\makeevenhead{custompage}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.even.left"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.even.center"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.even.right"/>
    <xsl:text>}</xsl:text>

    <xsl:text>\makeoddhead{custompage}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.odd.left"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.odd.center"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.header.odd.right"/>
    <xsl:text>}</xsl:text>

    <xsl:text>\makeevenfoot{custompage}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.even.left"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.even.center"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.even.right"/>
    <xsl:text>}</xsl:text>

    <xsl:text>\makeoddfoot{custompage}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.odd.left"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.odd.center"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="pagestyle.footer.odd.right"/>
    <xsl:text>}</xsl:text>

    <xsl:text>\pagestyle{custompage}</xsl:text>
  </xsl:template>

  <xsl:template match="d:*" mode="pagestyle.header.even.left">
    <xsl:text>{\scriptsize \thepage}</xsl:text>
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.header.even.center">
    <xsl:text>{\scriptsize </xsl:text>
    <xsl:apply-templates select="d:info/d:author"/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.header.even.right">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.header.odd.left">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.header.odd.center">
    <xsl:text>{\scriptsize </xsl:text>
    <xsl:apply-templates select="d:info/d:title"/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.header.odd.right">
    <xsl:text>{\scriptsize \thepage}</xsl:text>
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.even.left">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.even.center">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.event.right">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.odd.left">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.odd.center">
  </xsl:template>
  
  <xsl:template match="d:*" mode="pagestyle.footer.odd.right">
  </xsl:template>
</xsl:stylesheet>