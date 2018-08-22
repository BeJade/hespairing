main.pdf: \
ref.bib \
intro.tex \
background.tex \
curves.tex \
lines.tex \
comparison.tex \
conclusions.tex \
main.tex
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main

clean:
	rm -rf *.log *.aux *.blg *.bbl *.out
	rm -rf main.pdf
