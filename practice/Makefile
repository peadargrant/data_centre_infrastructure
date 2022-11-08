PRACTICE_PDF=$(patsubst %_practice.Rnw, %_practice.pdf, $(wildcard *_practice.Rnw))

default: $(PRACTICE_PDF)

all: default 

.SECONDARY:

%_practice.tex: %_practice.Rnw
	Rscript -e "library(knitr)" -e "knitr::knit('$<','$@')"

%_practice.pdf: %_practice.tex
	latexmk -g -pdf $(patsubst %.pdf, %, $@)



