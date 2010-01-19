<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml"
	version="1.0">

	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl" />

	<xsl:output method="html" encoding="UTF-8" indent="yes" />

	<!-- Chunking -->
	<xsl:param name="chunker.output.indent" select="'yes'" />
	<xsl:param name="use.id.as.filename" select="1" />
	<xsl:param name="chunk.section.depth" select="0" />
	<xsl:param name="chunker.output.encoding">UTF-8</xsl:param>

	<!-- Default CSS stylesheet -->
	<xsl:param name="html.stylesheet">default.css</xsl:param>

	<!-- Copyright years as a range. -->
	<xsl:param name="make.year.ranges" select="1" />

	<xsl:param name="toc.section.depth" select="1" />

	<xsl:param name="section.autolabel" select="1" />
	<xsl:param name="section.label.includes.component.label" select="1" />

	<!-- Admonitions -->
	<xsl:param name="admon.graphics" select="1" />
	<xsl:param name="admon.graphics.extension" select="'.png'"></xsl:param>
	<xsl:param name="admon.graphics.path">../../images/</xsl:param>

	<!-- Callouts -->
	<xsl:param name="callout.graphics" select="1" />
	<xsl:param name="callout.graphics.path" select="'../../images/callouts/'" />

	<!-- Image scaling attributes are used to produce proper printed
	     output. Ignore this for HTML output. -->
	<xsl:param name="ignore.image.scaling" select="1" />

	<!-- Create span tags with a class for filename tags -->
	<xsl:template match="filename">
		<html:span class="{name(.)}">
			<xsl:call-template name="inline.monoseq" />
		</html:span>
	</xsl:template>
</xsl:stylesheet>
