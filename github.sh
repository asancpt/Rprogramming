NOW=$(date +"%m-%d-%Y")
make pdf
cp docs/Rprogramming.pdf docs/Rprogramming-original.pdf
make gitbook
sh ./crop.sh
cp docs/Rprogramming-crop.pdf docs/Rprogramming.pdf
Rscript README.R
git add .
git commit -m "$NOW $1 $2" 
git push
