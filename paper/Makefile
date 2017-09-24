main.pdf: \
ref.bib \
intro.tex \
Tatepairing.tex \
curves.tex \
formulas.tex \
comparison.tex \
discussion.tex \
conclusions.tex \
main.tex
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main

clean:
	rm -rf *.log *.aux *.blg *.bbl *.out
	rm -rf main.pdf
