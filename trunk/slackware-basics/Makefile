# $Id: Makefile,v 1.8 2005/04/17 14:50:34 daniel Exp $

CURRENTDIR=`pwd`

all:	fmt-html fmt-pdf

lint:
	xmllint --noout --valid src/slackware-basics.xml

touch-pubdate:
	cat src/slackware-basics.xml | sed "s/<pubdate><\/pubdate>/<pubdate>`date`<\/pubdate>/" > src/slackware-basics.xml.new
	mv src/slackware-basics.xml.new src/slackware-basics.xml

fmt-html: touch-pubdate
	jade -t sgml -d src/slackware-basics.dsl#html \
		/usr/share/sgml/xml.dcl \
		src/slackware-basics.xml
	mv *.html html/
	cp src/normal.css html/
	tidy -q -i -asxhtml -f err.out -m html/*.html

fmt-tex: touch-pubdate
	jade -t tex -o tex/slackware-basics.tex \
		-d src/slackware-basics.dsl#print \
		/usr/share/sgml/xml.dcl \
		src/slackware-basics.xml

fmt-pdf: fmt-tex
	(cd pdf ; pdfjadetex ../tex/slackware-basics.tex ; pdfjadetex ../tex/slackware-basics.tex ; pdfjadetex ../tex/slackware-basics.tex )


clean:
	rm -rf html/*.html 
	rm -f html/normal.css
	rm -f pdf/*.pdf
	rm -f pdf/*.out
	rm -f pdf/*.log
	rm -f pdf/*.aux
	rm -f tex/*.tex
	rm -f tex/*.dvi
