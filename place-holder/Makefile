latexfile = paper
bibfile = paper
figures = figures/*


.PHONY: FORCE
${latexfile}.pdf: FORCE ${bibfile}.bib
	./latexrun ${latexfile}.tex

.PHONY: clean
clean:
	./latexrun --clean-all

