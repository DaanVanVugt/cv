NODE_EXISTS=$(shell [ -d node_modules ] && echo 1 || echo 0 )

all: html pdf txt

html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md metadata.yaml
	@./scripts/modify_html.sh

pdf: index.html
ifeq ($(NODE_EXISTS), 1)
	@node puppeteer/print.js
	@echo "created pdf file"
else
	@echo "ERROR: no puppeteer installation found in subfolder - see README"
endif


txt: index.md
	pandoc --standalone --from markdown+smart --to plain -o CV_DaanVanVugt.txt index.md

clean:
	rm -f *.html *.pdf *.txt
