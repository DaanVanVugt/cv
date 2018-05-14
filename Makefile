all: html pdf txt

html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md metadata.yaml
	@./scripts/modify_html.sh

pdf: index.html
	wkhtmltopdf -T 20 -B 20 index.html CV_ToonWeyens.pdf

txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o CV_ToonWeyens.txt index.md

clean:
	rm -f *.html *.pdf *.txt
