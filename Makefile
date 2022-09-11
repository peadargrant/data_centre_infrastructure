# Data Centre Infrastructure Makefile

NOTES_DOC=data_centre_infrastructure_notes

$(NOTES_DOC).pdf: $(NOTES_DOC).tex $(wildcard */*_notes.tex) $(wildcard */*_lab.tex)
	latexmk -pdf $(patsubst %.pdf,%,$@)

