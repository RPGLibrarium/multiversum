all:
	pdflatex -output-directory=./build/ src/*.tex
	pdflatex -output-directory=./build/ src/*.tex
	make clear-build-artifacts

example:
	pdflatex -output-directory=./build/ src/multiversum-xxx.tex
	pdflatex -output-directory=./build/ src/multiversum-xxx.tex
	make clear-build-artifacts

clear-build-artifacts:
	rm build/*.log
	rm build/*.aux
	rm build/*.out

clean:
	rm build/*
