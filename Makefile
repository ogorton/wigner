html:
	pandoc wignerdocs.md -o index.html --standalone --toc --mathjax

pdf:
	pandoc wignerdocs.md -o wignerdocs.pdf
