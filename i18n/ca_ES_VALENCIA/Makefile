CURRENTDIR=`pwd`
BOOKXML=xml/slackware-basics.xml

all:	fmt-html fmt-html-singlepage fmt-fo

lint:
	xmllint --noout --valid xml/slackware-basics.xml

touch-pubdate:
	#sed -i "s/<pubdate>.*<\/pubdate>/<pubdate>`date`<\/pubdate>/" $(BOOKXML) 

fmt-html: touch-pubdate
	xmlto -o html/ -x xsl/html-chunk.xsl --skip-validation html $(BOOKXML) 
	cp xml/default.css html/

fmt-html-singlepage: touch-pubdate
	xmlto -o html-singlepage/ -x xsl/html-singlepage.xsl --skip-validation html-nochunks $(BOOKXML) 
	cp xml/default.css html-singlepage/

fmt-fo:
	xmlto -o fo/ -x xsl/fo.xsl --skip-validation fo $(BOOKXML)

.PHONY: clean
clean:
	rm -rf html/*.html 
	rm -f html/default.css
	rm -rf html-singlepage/*.html 
	rm -f html-singlepage/default.css
	rm -f fo/*.fo
	rm -f pdf/*.pdf
