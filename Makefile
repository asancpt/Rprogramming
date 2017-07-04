gitbook:
	Rscript _render.R "bookdown::gitbook"

word:
	Rscript --quiet _render.R "bookdown::word_document2"

all:
	Rscript --quiet _render.R

pdfq: 
	Rscript --quiet _render.R "bookdown::pdf_book"

pdf: 
	Rscript _render.R "bookdown::pdf_book"

epub: 
	Rscript --quiet _render.R "bookdown::epub_book"
