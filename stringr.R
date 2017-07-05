#"Stringr"
#R Ç¥ÁØ base ÆÐÅ°Áö¿¡ Æ÷ÇÔµÈ ÇÔ¼ö±º¿Í ºñ½ÁÇÑ ±â´ÉÀ» ÇÏ´Â °ÍÀ¸·Î º¸ÀÌÁö¸¸ ´õ ÇÕ¸®ÀûÀÎ Ãâ·ÂÇü½ÄÀ» °¡Áö¹Ç·Î »ç¿ëÇÏ±â Æí¸®ÇÔ
#ÆÐÅ°ÁöÀÇ Æ¯Â¡
#1) factor¿Í character¸¦ °°Àº ¹æ½ÄÀ¸·Î Ã³¸®
#2) ÀÏ°ü¼º ÀÖ´Â ÇÔ¼ö ÀÌ¸§°ú ÀÎ¼ö
#3) ´Ù¸¥ ÇÔ¼öÀÇ ÀÔ·Â°ªÀ¸·Î »ç¿ëÇÏ±â Æí¸®ÇÑ Ãâ·Â°ª.
#  -ÀÔ·Â°ª NA°¡ Æ÷ÇÔµÇ¾î ÀÖÀ» ¶§´Â ±× ºÎºÐÀÇ °á°ú¸¦ NA·Î µ¹·ÁÁÜ
#4) »ç¿ëºóµµ°¡ ¶³¾îÁö´Â ¹®ÀÚ¿­ Á¶ÀÛ Ã³¸®¸¦ °ú°¨ÇÏ°Ô Á¦°ÅÇÏ¿© °£·«È­½ÃÅ´

#1. Installation
#install.packages("stringr")

library(stringr)

#2. Functions
#1) str_length(string): ¹®ÀÚ¿­ÀÇ ±æÀÌ¸¦ °è»ê
#¹®ÀÚ¿­ÀÇ ±æÀÌ¸¦ °è»êÇØÁÖ´Â ÇÔ¼ö
#base::nchar(x)¿Í °°Àº ±â´ÉÀ» ÇÏ´Â ÇÔ¼ö
#´Ü, NA ¿¡ ´ëÇØ¼­´Â 2°¡ ¾Æ´Ñ NA¸¦ µ¹·ÁÁÝ´Ï´Ù.
str_length(c("i", "like", "programming", NA))
#> [1]  1  4 11 NA
nchar(c("i", "like", "programming", NA))
#> [1]  1  4 11  2

#2) str_sub(string, start=1, end=-1)
#¹®ÀÚ¿­À» ºÎºÐÀûÀ¸·Î ÂüÁ¶, º¯°æÇØÁÖ´Â ÇÔ¼ö
#base::substr()¿Í °°Àº ±â´ÉÀ» ÇÏ´Â ÇÔ¼ö
#À½¼ö¸¦ »ç¿ëÇÏ¿© ¹®ÀÚ¿­ÀÇ ³¡À¸·Î ºÎÅÍÀÇ À§Ä¡¸¦ ÁöÁ¤ÇÒ ¼ö ÀÖ½À´Ï´Ù.
x <- "Michael Carreon"
str_sub(x,start=1,end=9)
#> [1] "Michael C" * ¶ç¾î¾²±â±îÁö Æ÷ÇÔÇÏ¿© 9¹øÂ° ¹®ÀÚ±îÁö ¹ÝÈ¯ÇØÁÝ´Ï´Ù.
str_sub(x,1,9)
#> [1] "Michael C" * start¿Í end´Â ¾²Áö ¾Ê¾Æµµ ¹«¹æÇÕ´Ï´Ù.
str_sub(x,end=7)
#> [1] "Michael" * start °ªÀ» ÁöÁ¤ÇØÁÖÁö ¾ÊÀ¸¸é, default °ªÀÎ 1·Î ÁöÁ¤µË´Ï´Ù. Áï, str_sub(x,1,7)°ú °°Àº °ªÀÌ ¹ÝÈ¯µË´Ï´Ù.
str_sub(x,-7)
#> [1] "Carreon" * À½¼ö¸¦ ÅëÇÏ¿© ¹®ÀÚ¿­ ³¡ºÎÅÍ 7¹øÂ° ¿À´Â ¹®ÀÚºÎÅÍ ¹ÝÈ¯ÇØÁÝ´Ï´Ù.
#Base R
substr(x,1,7)
#> [1] "Michael"

#3) str_c(..., sep='', collapse=NULL)
#¹®ÀÚ¿­À» ÅëÇÕÇØÁÖ´Â ÇÔ¼ö
#sepÀÇ default°¡ ½ºÆäÀÌ½º °ø¹éÀÌ ¾Æ´Ï¹Ç·Î base::paste0()¿Í ºñ½ÁÇÕ´Ï´Ù.
str_c(letters[-26], " comes before ", letters[-1])
#[1] "a comes before b" "b comes before c" "c comes before d" "d comes before e" "e comes before f"
#[6] "f comes before g" "g comes before h" "h comes before i" "i comes before j" "j comes before k"
#[11] "k comes before l" "l comes before m" "m comes before n" "n comes before o" "o comes before p"
#[16] "p comes before q" "q comes before r" "r comes before s" "s comes before t" "t comes before u"
#[21] "u comes before v" "v comes before w" "w comes before x" "x comes before y" "y comes before z"
##Base R
paste0(letters[-26], " comes before ", letters[-1])
str_c(letters, collapse = ", ")
#> [1] "a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z"
#sep¿Í collapseÀÇ Â÷ÀÌ´Â ÇÑ º¤ÅÍ ¾È¿¡ Á¸ÀçÇÏ´À³Ä ¾Æ´Ï³ÄÀÔ´Ï´Ù.
str_c("¾È","³ç","ÇÏ","¼¼","¿ä",sep="_")
#> [1] "¾È_³ç_ÇÏ_¼¼_¿ä"  
str_c(c("¾È","³ç","ÇÏ","¼¼","¿ä"),collapse="_")
#> [1] "¾È_³ç_ÇÏ_¼¼_¿ä"

#4) str_split(string, pattern, n=Inf)
#¹®ÀÚ¿­À» ºÐ¸®ÇØÁÖ´Â ÇÔ¼ö--> °á°ú°ªÀº listÀÔ´Ï´Ù.
#base::strsplit(x, split)¿Í ´ëÀÀÇÏ´Â ÇÔ¼öÀÔ´Ï´Ù.
#str_split_fixed()µµ ÀÖ°í, °á°ú°ªÀº matrix
fruits <- c("apples and oranges and pears and bananas", "pineapples and mangos and guavas")
str_split(fruits, " and ")
#> [[1]]
#> [1] "apples"  "oranges" "pears"   "bananas"
#> 
#> [[2]]
#> [1] "pineapples" "mangos"     "guavas"
#Base R
strsplit(fruits, "and")
#> [[1]]
#> [1] "apples "   " oranges " " pears "   " bananas" 
#> 
#> [[2]]
#> [1] "pineapples " " mangos "    " guavas"
str_split(fruits, " and ", n = 3)
#> [[1]]
#> [1] "apples"            "oranges"           "pears and bananas"
#> 
#> [[2]]
#> [1] "pineapples" "mangos"     "guavas"
str_split(fruits, " and ", n = 2)
#> [[1]]
#> [1] "apples"                        "oranges and pears and bananas"
#> 
#> [[2]]
#> [1] "pineapples"        "mangos and guavas"
str_split_fixed(fruits, " and ", 4)
#>      [,1]         [,2]      [,3]     [,4]     
#> [1,] "apples"     "oranges" "pears"  "bananas"
#> [2,] "pineapples" "mangos"  "guavas" "

#5)str_detect(string, pattern)
#¸ÅÄ¡ÇÏ´Â °÷ÀÌ ÀÖ´ÂÁö ¾ø´ÂÁö¸¦ logical °ª(True or False)À¸·Î ¹ÝÈ¯ÇØÁÖ´Â ÇÔ¼ö
#base::grepl(pattern, x)°ú ´ëÀÀ
fruit <- c("apple", "banana", "pear", "pinapple")
str_detect(fruit, "a")
#> [1] TRUE TRUE TRUE TRUE
str_detect(fruit, "^a")
#> [1]  TRUE FALSE FALSE FALSE
str_detect(fruit, "a$")
#> [1] FALSE  TRUE FALSE FALSE
str_detect(fruit, "b")
#> [1] FALSE  TRUE FALSE FALSE
str_detect(fruit, "[aeiou]")
#> [1] TRUE TRUE TRUE TRUE

#6) str_count(string, pattern)
#¸ÅÄ¡ÇÏ´Â °÷ÀÇ ¼ö¸¦ ¹ÝÈ¯ÇØÁÖ´Â ÇÔ¼ö
#±× ±ÛÀÚ°¡ ¸î °³ Æ÷ÇÔµÇ¾î ÀÖ´ÂÁö ¾Ë·ÁÁÝ´Ï´Ù.
str_count(fruit, "p")
#> [1] 2 0 1 3
str_count(fruit, c("a", "b", "p", "p"))
#> [1] 1 1 1 3

#7)str_locate(string, pattern)
#Ã³À½À¸·Î ¸ÅÄ¡µÇ´Â °÷ÀÇ start, end À§Ä¡¸¦ Çà·Ä·Î ¹ÝÈ¯ÇØÁÖ´Â ÇÔ¼ö
str_locate(fruit, "e")
#>      start end
#> [1,]     5   5
#> [2,]    NA  NA
#> [3,]     2   2
#> [4,]     8   8
str_locate(fruit, "pl")
#>      start end
#> [1,]     3   4
#> [2,]    NA  NA
#> [3,]    NA  NA
#> [4,]     6   7

#8)str_extract(string, pattern)
#¸ÅÄ¡µÈ ºÎºÐ ¹®ÀÚ¿­À» ÃßÃâÇÏ´Â ÇÔ¼ö
#¸ÅÄ¡µÇÁö ¾ÊÀº ¿ä¼Ò´Â NA·Î Ãâ·ÂÇÕ´Ï´Ù
#base::grep(pattern, x, value=TRUE)¿Í ºñ½ÁÇÏ³ª ÀÌ ÇÔ¼ö´Â ¸ÅÄ¡µÈ ¿ä¼Ò¸¸ ¿ø·¡ÀÇ ÇüÅÂ·Î µ¹·ÁÁÝ´Ï´Ù
shopping_list <- c("apples x4", "flour", "sugar", "milk x2")
str_extract(shopping_list, "\\d")
#> [1] "4" NA  NA  "2"
grep("\\d", shopping_list, value = TRUE)
#> [1] "apples x4" "milk x2"
str_extract(shopping_list, "[a-z]+")
#> [1] "apples" "flour"  "sugar"  "milk"
grep("[a-z]+", shopping_list, value = TRUE)
#> [1] "apples x4" "flour"     "sugar"     "milk x2"

#9)str_match(string, pattern)
#¸ÅÄ¡µÈ ºÎºÐ ¹®ÀÚ¿­À» ÃßÃâÇÏ°í ÂüÁ¶¸¦ Çà·Ä·Î µ¹·ÁÁÖ´Â ÇÔ¼ö
#str_extract ÇÔ¼öÀÇ °á°ú¸¦ 1¿­¿¡ , °¢ °ýÈ£¿¡ ¸ÅÄ¡µÈ ÀÌÈÄÀÇ °á°ú°¡ 2¿­ ÀÌÈÄ¿¡ µé¾î°©´Ï´Ù.
strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569", "387 287 6718", "apple", "233.398.9187  ", "482 952 3315", "239 923 8115", "842 566 4692", "Work: 579-499-7527", "$1000", "Home: 543.355.3679")
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
str_extract(strings, phone)
#>  [1] "219 733 8965" "329-293-8753" NA             "595 794 7569"
#>  [5] "387 287 6718" NA             "233.398.9187" "482 952 3315"
#>  [9] "239 923 8115" "842 566 4692" "579-499-7527" NA            
#> [13] "543.355.3679"
str_match(strings, phone)
#>       [,1]           [,2]  [,3]  [,4]  
#>  [1,] "219 733 8965" "219" "733" "8965"
#>  [2,] "329-293-8753" "329" "293" "8753"
#>  [3,] NA             NA    NA    NA    
#>  [4,] "595 794 7569" "595" "794" "7569"
#>  [5,] "387 287 6718" "387" "287" "6718"
#>  [6,] NA             NA    NA    NA    
#>  [7,] "233.398.9187" "233" "398" "9187"
#>  [8,] "482 952 3315" "482" "952" "3315"
#>  [9,] "239 923 8115" "239" "923" "8115"
#> [10,] "842 566 4692" "842" "566" "4692"
#> [11,] "579-499-7527" "579" "499" "7527"
#> [12,] NA             NA    NA    NA    
#> [13,] "543.355.3679" "543" "355" "3679"

#10)str_replace(string, pattern, replacement)
#¸ÅÄ¡µÇÁö ¾ÊÀº ºÎºÐÀº ±×´ë·Î µÎ°í ¸ÅÄ¡µÈ ºÎºÐ¸¸ Ä¡È¯ÇÏ´Â ÇÔ¼ö
#base::sub(¸ÅÄ¡ÇÒ ºÎºÐ,Ä¡È¯ÇÒ ¹®ÀÚ,¹®ÀÚ¿­)¿Í °°Àº ±â´ÉÀ» ÇÕ´Ï´Ù.
fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")
#> [1] "-ne apple"     "tw- pears"     "thr-e bananas"
str_replace_all(fruits, "[aeiou]", "-")
#> [1] "-n- -ppl-"     "tw- p--rs"     "thr-- b-n-n-s"

#11)str_trim(string, side="both")
#°ø¹é¹®ÀÚ¸¦ Á¦°ÅÇÏ´Â ÇÔ¼ö
str_trim("        fruits        ", side="both")
#>[1] "fruits" 
Trim = function(x) gsub("^\\s+|\\s+$", "", x)
Trim("        fruits        ")
#>[1] "fruits"

#"lubridate"
#lubri:lubricate(±â¸§À» Ä¡´Ù, ±â¸§À» ¹Ù¸£´Ù, ¿øÈ°È÷ ÇÏ´Ù)+date
#Lubridate is an R package that makes it easier to work with dates and times 
#1.Installation
install.packages("lubridate")
library(lubridate)

#2.Functions
#1)Parsing dates and times(dates & times °´Ã¼ ¸¸µé±â)
##Date
#Base R
as.Date("2011-06-04")
## [1] "2011-06-04"
as.Date("2011-6-4")
## [1] "2011-06-04"
as.Date("2011/06/04")
## [1] "2011-06-04"
## 
as.Date("20110604") # error 
as.Date("06-04-2011") ### [1] "0006-04-20" (¹Ì±¹½Ä Ç¥Çö) #Problem

#lubridate package 
ymd("2011/06/04")
## [1] "2011-06-04"
#½Éº¼ÀÇ ¼ø¼­¸¦ ¹Ù²Ù¾îµµ
mdy("06/04/2011")
## [1] "2011-06-04"
dmy("04/06/2011")
## [1] "2011-06-04"

#lubridate¿¡¼­ÀÇ ³¯Â¥ ¾ç½ÄÀÇ °ü¿ë
#heterogeneous format(ºÒ±ÕÀÏÇÑ ¾ç½Ä)¿¡ ´ëÇÑ ´Ù¾çÇÑ ÁØºñµéÀÌ µÇ¾îÀÖÀ½
ymd("2011/06/04")
## [1] "2011-06-04"
ymd("2011-06-04")
## [1] "2011-06-04"
ymd("20110604")
## [1] "2011-06-04"
ymd("110604")
## [1] "2011-06-04"
ymd("11.06.04")
## [1] "2011-06-04"
ymd("11,06,04")
## [1] "2011-06-04"
ymd("11_06.04") 
## [1] "2011-06-04"
ymd("2011  06  04") 
## [1] "2011-06-04"
ymd("2011!?06??!04") 
## [1] "2011-06-04"
ymd("2011 =06??04") 
## [1] "2011-06-04"

##Dates + Times °´Ã¼ ¸¸µé±â
#Base R
as.POSIXct("2011-06-04 13:30:50")
## [1] "2011-06-04 13:30:50 KST"
as.POSIXct("2011-06-04 13") # No
## [1] "2011-06-04 KST"
strptime("2011-06-04 13:30:50", "%Y-%m-%d %H:%M:%S")
## [1] "2011-06-04 13:30:50 KST"

#lubridate package
ymd_hms("2011-06-04 13:30:50")
## [1] "2011-06-04 13:30:50 UTC"
#Á¶±Ý ´õ À¶Åë¼ºÀÌ ÀÖ°Ô »ç¿ëÇÒ ¼ö ÀÖ´Â Á¡
ymd_h("2011-06-04 13")
## [1] "2011-06-04 13:00:00 UTC"

#2)Setting and Extracting information
#ºÎºÐÁ¤º¸¸¦ ÃßÃâÇÏ±â À§ÇÑ °£Æí ÇÔ¼öµé
#ÇÔ¼ö¸íÄªµµ »ó½ÄÀûÀ¸·Î ÀÌÇØÇÏ±â ½¬¿î °Íµé
#:second(), minute(), hour(), day(), wday(), yday(), week(), month(), year()
ld1 <- ymd_hms("2011-06-04 13:30:50")

year(ld1)
## [1] 2011
month(ld1)
## [1] 6
day(ld1)
## [1] 4
wday(ld1)
## [1] 7
yday(ld1)
## [1] 155
hour(ld1)
## [1] 13
minute(ld1)
## [1] 30
second(ld1)
## [1] 50

# month, wday ÀÇ °æ¿ì label ÀÎÀÚ¸¦ °¡Áö°í ÀÖ´Âµ¥ ÀÌ¸¦ TRUE ·Î ¼³Á¤ÇÒ °æ¿ì
month(ld1, label = T)
## [1] Jun
## 12 Levels: Jan < Feb < Mar < Apr < May < Jun < Jul < Aug < Sep < ... < Dec
wday(ld1, label = T)
## [1] Sat
## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat

#3)Update date-time
#"2011³â 6¿ù 4ÀÏ 13:30:50" ·Î ÀúÀåµÇ¾îÀÖ´ø ld1 ¿¡ ´ëÇØ ½Ã°¢(hour)À» 10½Ã·Î ¹Ù²Ù·Á¸é 
hour(ld1) <- 10
ld1
## [1] "2011-06-04 10:30:50 UTC"

#update() ÇÔ¼ö¸¦ ÀÌ¿ëÇØ 10½Ã·Î º¯°æµÈ ld1 À» ´Ù½Ã 13·Î
ld1 <- update(ld1, hour = 13)
ld1
## [1] "2011-06-04 13:30:50 UTC"

#4) Arithmetic with date times
#lubridate ¿Í °°Àº ÆÐÅ°Áö¸¦ °øºÎÇÏ´Â ¸ñÀû Áß °¡Àå Áß¿äÇÑ Æ¯Â¡
#»ê¼ú¿¬»ê¿¡¼­ »ç¿ëÇÒ ¼ö ÀÖ´Â ÆÐ¹Ð¸®:°£ÆíÇÔ¼ö¸¶Áö¸·¿¡ "s" °¡ ºÙÀ½À¸·Î½á ¾²ÀÓÀÌ ´Þ¶óÁø °Í
#days(), seconds(), minutes(), hours(), weeks(), years(), milliseconds(), microseconds(), nanoseconds(), picoseconds()
ymd("2016-01-30") + days(2)
## [1] "2016-02-01"
ymd("2016-01-30") - days(1:30)
##  [1] "2016-01-29" "2016-01-28" "2016-01-27" "2016-01-26" "2016-01-25"
##  [6] "2016-01-24" "2016-01-23" "2016-01-22" "2016-01-21" "2016-01-20"
## [11] "2016-01-19" "2016-01-18" "2016-01-17" "2016-01-16" "2016-01-15"
## [16] "2016-01-14" "2016-01-13" "2016-01-12" "2016-01-11" "2016-01-10"
## [21] "2016-01-09" "2016-01-08" "2016-01-07" "2016-01-06" "2016-01-05"
## [26] "2016-01-04" "2016-01-03" "2016-01-02" "2016-01-01" "2015-12-31"
ymd("2013-01-31") + months(0:11)
##  [1] "2013-01-31" NA           "2013-03-31" NA           "2013-05-31"
##  [6] NA           "2013-07-31" "2013-08-31" NA           "2013-10-31"
## [11] NA           "2013-12-31"

#5) Application with lubridate and dplyr
#lubridate package ¿¡ ³»ÀåµÈ µ¥ÀÌÅÍ¼Â lakers ¸¦ ÀÌ¿ë
#data(lakers)

lakers <- lakers %>% tbl_df
lakers #--> date, time º¯¼ö°¡ ¼­·Î ³ª´µ¾î ÀÖ´Ù.
## # A tibble: 34,624 <U+00D7> 13
##        date opponent game_type  time period      etype  team
##       <int>    <chr>     <chr> <chr>  <int>      <chr> <chr>
## 1  20081028      POR      home 12:00      1  jump ball   OFF
## 2  20081028      POR      home 11:39      1       shot   LAL
## 3  20081028      POR      home 11:37      1    rebound   LAL
## 4  20081028      POR      home 11:25      1       shot   LAL
## 5  20081028      POR      home 11:23      1    rebound   LAL
## 6  20081028      POR      home 11:22      1       shot   LAL
## 7  20081028      POR      home 11:22      1       foul   POR
## 8  20081028      POR      home 11:22      1 free throw   LAL
## 9  20081028      POR      home 11:00      1       foul   LAL
## 10 20081028      POR      home 10:53      1       shot   POR
## # ... with 34,614 more rows, and 6 more variables: player <chr>,
## #   result <chr>, points <int>, type <chr>, x <int>, y <int>

lakers <- lakers %>% 
    mutate(date = paste(date, time) %>% ymd_hm) %>% 
    rename(time_index = date) %>% 
    select(-time)

#date, time µÎº¯¼ö¸¦ ºÙÀÎ ¹®ÀÚ¿­¿¡ ´ëÇØ ymd_hm() ÇÔ¼ö·Î ³Ñ±ä ÈÄ
#time_index ¶ó´Â º¯¼ö¿¡ ´ã°í,
#date, time µÎ º¯¼ö¸¦ Á¦¿ÜÇÑ °ÍÀÌ´Ù.

lakers
## # A tibble: 34,624 <U+00D7> 12
##             time_index opponent game_type period      etype  team
##                 <dttm>    <chr>     <chr>  <int>      <chr> <chr>
## 1  2008-10-28 12:00:00      POR      home      1  jump ball   OFF
## 2  2008-10-28 11:39:00      POR      home      1       shot   LAL
## 3  2008-10-28 11:37:00      POR      home      1    rebound   LAL
## 4  2008-10-28 11:25:00      POR      home      1       shot   LAL
## 5  2008-10-28 11:23:00      POR      home      1    rebound   LAL
## 6  2008-10-28 11:22:00      POR      home      1       shot   LAL
## 7  2008-10-28 11:22:00      POR      home      1       foul   POR
## 8  2008-10-28 11:22:00      POR      home      1 free throw   LAL
## 9  2008-10-28 11:00:00      POR      home      1       foul   LAL
## 10 2008-10-28 10:53:00      POR      home      1       shot   POR
## # ... with 34,614 more rows, and 6 more variables: player <chr>,
## #   result <chr>, points <int>, type <chr>, x <int>, y <int>

#Using "group by" ¿ùº° Æò±ÕÀ» x, y º¯¼ö¿¡ ´ëÇØ¼­ °è»ê:month() ÇÔ¼ö¸¦ ÀÌ¿ëcf) ¿¬º° Æò±ÕÀ» °è»êÇÏ°í ½Í´Ù¸é year() ÀÌ¿ë
lakers %>% 
    group_by(month(time_index)) %>% 
    summarize(mean_x = mean(x, na.rm = T), mean_y = mean(y, na.rm = T))
## # A tibble: 7 <U+00D7> 3
##   `month(time_index)`   mean_x   mean_y
##                 <dbl>    <dbl>    <dbl>
## 1                   1 25.49382 13.89279
## 2                   2 25.01759 13.17499
## 3                   3 25.51587 13.20571
## 4                   4 25.38344 13.46396
## 5                  10 24.92188 13.12500
## 6                  11 25.47463 13.36926
## 7                  12 25.05895 13.48262


#Using "filter" "2008-10-28 12:00:00" ÀÌÀüÀÇ ±â°£À» ¼­ºê¼¼ÆÃ
lakers %>% 
    filter(time_index <= ymd_hms("2008-10-28 12:00:00"))
## # A tibble: 416 <U+00D7> 12
##             time_index opponent game_type period      etype  team
##                 <dttm>    <chr>     <chr>  <int>      <chr> <chr>
## 1  2008-10-28 12:00:00      POR      home      1  jump ball   OFF
## 2  2008-10-28 11:39:00      POR      home      1       shot   LAL
## 3  2008-10-28 11:37:00      POR      home      1    rebound   LAL
## 4  2008-10-28 11:25:00      POR      home      1       shot   LAL
## 5  2008-10-28 11:23:00      POR      home      1    rebound   LAL
## 6  2008-10-28 11:22:00      POR      home      1       shot   LAL
## 7  2008-10-28 11:22:00      POR      home      1       foul   POR
## 8  2008-10-28 11:22:00      POR      home      1 free throw   LAL
## 9  2008-10-28 11:00:00      POR      home      1       foul   LAL
## 10 2008-10-28 10:53:00      POR      home      1       shot   POR
## # ... with 406 more rows, and 6 more variables: player <chr>,
## #   result <chr>, points <int>, type <chr>, x <int>, y <int>

# "2008-10-28 12:00:00" ~ "2009-03-09 00:33:00" ÀÇ ±â°£¿¡ ´ëÇØ¼­ ¼­ºê¼¼ÆÃ
lakers %>% 
    filter(time_index >= ymd_hms("2008-10-28 12:00:00"), time_index <= ymd_hms("2009-03-09 00:33:00"))
#interval() ÇÔ¼ö¿Í %within% ¿¬»êÀÚ¸¦ ÀÌ¿ëÇÏ¸é Á¶±Ý ´õ Á÷°üÀûÀÎ ¼­ºê¼¼ÆÃ(interval() ÇÔ¼ö´ë½Å %--% ¿¬»êÀÚ¸¦ ½áµµ µÈ´Ù)
inter <- interval(ymd_hms("2008-10-28 12:00:00"), ymd_hms("2009-03-09 00:33:00"))
lakers %>% 
    filter(time_index %within% inter)
## # A tibble: 25,554 <U+00D7> 12
##             time_index opponent game_type period     etype  team
##                 <dttm>    <chr>     <chr>  <int>     <chr> <chr>
## 1  2008-10-28 12:00:00      POR      home      1 jump ball   OFF
## 2  2008-10-29 12:00:00      LAC      away      1 jump ball   OFF
## 3  2008-10-29 11:36:00      LAC      away      1      shot   LAL
## 4  2008-10-29 11:24:00      LAC      away      1      shot   LAC
## 5  2008-10-29 11:24:00      LAC      away      1   rebound   LAL
## 6  2008-10-29 11:08:00      LAC      away      1      shot   LAL
## 7  2008-10-29 10:58:00      LAC      away      1      shot   LAC
## 8  2008-10-29 10:57:00      LAC      away      1   rebound   LAL
## 9  2008-10-29 10:41:00      LAC      away      1      shot   LAL
## 10 2008-10-29 10:40:00      LAC      away      1   rebound   LAC
## # ... with 25,544 more rows, and 6 more variables: player <chr>,
## #   result <chr>, points <int>, type <chr>, x <int>, y <int>
