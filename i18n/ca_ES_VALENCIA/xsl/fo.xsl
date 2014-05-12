<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

  <xsl:output encoding="UTF-8" />

  <xsl:param name="fop1.extensions">1</xsl:param>
  <xsl:param name="fop.extensions">0</xsl:param>
  
  <xsl:param name="page.height">11in</xsl:param>
  <xsl:param name="page.width">8.5in</xsl:param>

  <xsl:param name="double.sided" select="1"/>

  <!-- Copyright years as a range. -->
  <xsl:param name="make.year.ranges" select="1" />

  <xsl:param name="body.font.master">10</xsl:param>
  <xsl:param name="toc.section.depth">1</xsl:param>
  <xsl:param name="section.autolabel" select="1"/>
  <xsl:param name="section.label.includes.component.label" select="1"/>
  <xsl:param name="section.autolabel.max.depth" select="1"/>

  <xsl:param name="default.table.width">60%</xsl:param>

  <xsl:param name="body.start.indent">0pt</xsl:param>
  <xsl:param name="header.column.widths">1 2 1</xsl:param>
  <xsl:param name="marker.section.level">1</xsl:param>

  <!--
    <xsl:attribute-set name="monospace.verbatim.properties">
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    <xsl:attribute name="hyphenation-character">\</xsl:attribute>
    </xsl:attribute-set>
  -->

  <!-- Callouts -->
  <xsl:param name="callout.graphics" select="0"/>
  <xsl:param name="callout.unicode" select="1"/>

  <xsl:template name="header.content">
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>

    <xsl:variable name="candidate">
      <xsl:choose>
        <xsl:when test="$sequence = 'odd' and $position = 'left'"> </xsl:when>

        <xsl:when test="$sequence = 'odd' and $position = 'center'">
          <xsl:apply-templates select="." mode="object.title.markup"/>
        </xsl:when>

        <xsl:when test="$sequence = 'odd' and $position = 'right'">
          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$sequence = 'even' and $position = 'left'">

          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$sequence = 'even' and $position = 'center'">
          <xsl:value-of select="ancestor-or-self::book/bookinfo/title"/>
        </xsl:when>

        <xsl:when test="$sequence = 'even' and $position = 'right'"> </xsl:when>

        <xsl:when test="$sequence = 'first' and $position = 'left'"> </xsl:when>

        <xsl:when test="$sequence = 'first' and $position = 'right'"> </xsl:when>

        <xsl:when test="$sequence = 'first' and $position = 'center'">
          <xsl:value-of select="ancestor-or-self::book/bookinfo/corpauthor"/>
        </xsl:when>

        <xsl:when test="$sequence = 'blank' and $position = 'left'">
          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$sequence = 'blank' and $position = 'center'"> </xsl:when>

        <xsl:when test="$sequence = 'blank' and $position = 'right'"> </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$sequence='blank' and $headers.on.blank.pages=0"> </xsl:when>

      <xsl:when test="$pageclass = 'titlepage'"> </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$candidate"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="blank.page.content">
    <!-- Work around a stylesheet bug the prevented mapping of the
      'blank-body' flow-name to a region-name in the layout master
      set. -->

  </xsl:template>

  <xsl:template match="emphasis">
    <xsl:variable name="depth">
      <xsl:call-template name="dot.count">
	<xsl:with-param name="string">
	  <xsl:number level="multiple"/>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="@role='bold' or @role='strong'">
	<xsl:call-template name="inline.boldseq"/>
      </xsl:when>
      <xsl:when test="@role='underline'">
	<fo:inline text-decoration="underline">
	  <xsl:call-template name="inline.charseq"/>
	</fo:inline>
      </xsl:when>
      <xsl:when test="@role='strikethrough'">
	<fo:inline text-decoration="line-through">
	  <xsl:call-template name="inline.charseq"/>
	</fo:inline>
      </xsl:when>
      <xsl:when test="@role='cursor'">
	<fo:inline background-color="lightgrey">
	  <xsl:call-template name="inline.charseq"/>
	</fo:inline>
      </xsl:when>
      <xsl:otherwise>
	<xsl:choose>
	  <xsl:when test="$depth mod 2 = 1">
	    <fo:inline font-style="normal">
	      <xsl:apply-templates/>
	    </fo:inline>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="inline.italicseq"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
