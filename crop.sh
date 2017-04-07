cd docs
pdfjam --keepinfo --trim '4cm 2.5cm 3.5cm 3.0cm' --clip false --suffix "crop" Rprogramming.pdf 
open Rprogramming-crop.pdf
cd ..
