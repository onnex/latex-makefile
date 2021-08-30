# LaTeX Makefile v0.33 -- LaTeX only
# Modified from: https://scaron.info/blog/makefiles-for-latex.html

TOP=main
PAPER=$(TOP).tex  # set the path to your TeX file here
TEXFILES=$(wildcard $(PAPER) tex/*.tex)
ALL=$(TEXFILES)
SHELL=/bin/bash   # for the while loop below
WCDIR=wordcounts  # directory for word counts logs

all:  ## Compile paper
	rubber --pdf $(PAPER) || test -f $(TOP).glo || pdflatex $(PAPER) && rubber --pdf $(PAPER)

compat:
	pdflatex main.tex
	makeindex -s main.ist -t main.glg -o main.gls main.glo
	biber main
	pdflatex main.tex
	pdflatex main.tex

clean:  ## Clean output files
	rubber --clean $(PAPER)

watch:  ## Recompile on updates to the source file
	#@while true; do inotifywait $(ALL); sleep 0.01; make all; done
	latexmk -pdf -pvc -silent $(PAPER)

wcs: ## Show word count, short version
	@mkdir -p $(WCDIR) && texcount -inc $(PAPER) | tee "wordcounts/wc-`date -I`.txt" | grep 'Sum of files: '$(PAPER) -a2 | grep "Words in text" | cut -d' ' -f4

wordcount: wc
wc:  ## Show word count, long version
	@mkdir -p $(WCDIR) && texcount -inc $(PAPER) | tee "wordcounts/wc-`date -I`.txt"

