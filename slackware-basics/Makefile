# $Id: Makefile,v 1.1 2004/11/06 23:17:47 daniel Exp $

CURRENTDIR=`pwd`

all:	fmt-html fmt-pdf

fmt-html:
	jade -t sgml -d src/slackware-basics.dsl#html \
		/usr/share/sgml/docbook/dsssl-stylesheets/dtds/decls/xml.dcl \
		src/slackware-basics.xml
	mv *.html html/
	cp src/normal.css html/
	tidy -q -i -asxhtml -f err.out -m html/*.html

fmt-tex:
	jade -t tex -o tex/slackware-basics.tex \
		-d src/slackware-basics.dsl#print \
		/usr/share/sgml/docbook/dsssl-stylesheets/dtds/decls/xml.dcl \
		src/slackware-basics.xml

fmt-pdf: fmt-tex
	(cd pdf ; pdfjadetex ../tex/slackware-basics.tex ; pdfjadetex ../tex/slackware-basics.tex ; pdfjadetex ../tex/slackware-basics.tex )


clean:
	rm -rf html/*.html 
	rm -f html/normal.css
	rm -f pdf/*.pdf
	rm -f tex/*.tex
	rm -f tex/*.dvi
