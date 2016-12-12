filename=project

all: $(filename).pdf

clean:
	rm -rf *.aux *.bbl *.blg *.out *.run.xml *-blx.bib *.gz *.log *.tex .Rhistory

$(filename).pdf: $(filename).blg
	pdflatex $(filename).tex
	pdflatex $(filename).tex
	Rscript --vanilla -e "require(extrafont);embed_fonts('$(filename).pdf')"

$(filename).blg: $(filename).aux
	bibtex $(filename).aux

$(filename).aux: $(filename).tex references.bib
	pdflatex $(filename).tex

$(filename).tex: $(filename).rnw
	Rscript --vanilla -e "require(knitr);knit('$(filename).rnw')"

references.bib:

