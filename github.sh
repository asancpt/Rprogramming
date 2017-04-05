NOW=$(date +"%m-%d-%Y")
Rscript README.R
git add .
git commit -m "$NOW $1 $2" 
git push
