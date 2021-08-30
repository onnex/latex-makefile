# latex-makefile
Latex makefile used in the bachelor's / master thesis writing process

Dependencies (as far as I remember, some may be part of some other package listed):
* (pdf)latex, e.g. texlive
* biber
* rubber
* latexmk
* vim for editing
* zathura, evince or whatever pdf reader

Usage:
* `make all` -- build with rubber
* `make compat` -- build with pdflatex
* `make watch` -- build with latexmk and watch for changes (every time .tex-files are written to with e.g. vim's :w). Preferably run in separate terminal, running in background e.g. in same terminal as vim may not work correctly
* `make wordcount` or `make wc` -- count words from latest build (does not call build process)
* `make wcs` -- short version of the above, print only total word count
