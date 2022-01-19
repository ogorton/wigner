html:
	pandoc README.md -o index.html --standalone --toc --mathjax

pdf:
	 pandoc README.md -o readme.pdf
