gitbook:
	rm Rprogramming.Rmd; Rscript _render.R "bookdown::gitbook"

word:
	Rscript --quiet _render.R "bookdown::word_document2"

all:
	Rscript --quiet _render.R

pdfq: 
	Rscript --quiet _render.R "bookdown::pdf_book"

pdf: 
	rm Rprogramming.Rmd; Rscript _render.R "bookdown::pdf_book"; cd docs; pdfjam --keepinfo --trim '4cm 2.5cm 3.5cm 3.0cm' --clip false --suffix "crop" Rprogramming.pdf; mv Rprogramming.pdf Rprogramming-original.pdf; mv Rprogramming-crop.pdf Rprogramming.pdf; cd .. # This only works in MacOS

epub: 
	Rscript --quiet _render.R "bookdown::epub_book"
