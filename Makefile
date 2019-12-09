.PHONY: clean all

all: $(addsuffix .pdf, $(basename $(wildcard ausgaben/*.tex)))

%.pdf: %.tex
	xelatex $<
	xelatex $<
	rm -rf *.acn *.acr *.alg *.aux *.ist *.log *.fls *.out *.fdb_latexmk
	
clean:
	rm -rf *.acn *.acr *.alg *.aux *.ist *.log *.fls *.out *.fdb_latexmk
