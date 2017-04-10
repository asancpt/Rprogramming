Rscript -e "rmarkdown::render('$1', output_format = 'html_document')"
Rscript -e "rmarkdown::render('$1', output_format = 'word_document')"
# Rscript -e "rmarkdown::render('$1', output_format = 'tufte::tufte_html')"
# Rscript -e "rmarkdown::render('$1', output_format = 'pdf_document')"
