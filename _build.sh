#  'bookdown::pdf_book', 'bookdown::epub_book', 'bookdown::gitbook'

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook', clean = FALSE)"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', clean = FALSE)"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::tufte_book2')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::tufte_handout2')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::word_document2')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::html_document2')"
