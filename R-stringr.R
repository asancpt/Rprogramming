#"Stringr"
#R 표준 base 패키지에 포함된 함수군와 비슷한 기능을 하는 것으로 보이지만 더 합리적인 출력형식을 가지므로 사용하기 편리함
#패키지의 특징
#1) factor와 character를 같은 방식으로 처리
#2) 일관성 있는 함수 이름과 인수
#3) 다른 함수의 입력값으로 사용하기 편리한 출력값.
#  -입력값 NA가 포함되어 있을 때는 그 부분의 결과를 NA로 돌려줌
#4) 사용빈도가 떨어지는 문자열 조작 처리를 과감하게 제거하여 간략화시킴

#1. Installation
#install.packages("stringr")

library(stringr)

#2. Functions
#1) str_length(string): 문자열의 길이를 계산
#문자열의 길이를 계산해주는 함수
#base::nchar(x)와 같은 기능을 하는 함수
#단, NA 에 대해서는 2가 아닌 NA를 돌려줍니다.
str_length(c("i", "like", "programming", NA))
#> [1]  1  4 11 NA
nchar(c("i", "like", "programming", NA))
#> [1]  1  4 11  2

#2) str_sub(string, start=1, end=-1)
#문자열을 부분적으로 참조, 변경해주는 함수
#base::substr()와 같은 기능을 하는 함수
#음수를 사용하여 문자열의 끝으로 부터의 위치를 지정할 수 있습니다.
x <- "Michael Carreon"
str_sub(x,start=1,end=9)
#> [1] "Michael C" * 띄어쓰기까지 포함하여 9번째 문자까지 반환해줍니다.
str_sub(x,1,9)
#> [1] "Michael C" * start와 end는 쓰지 않아도 무방합니다.
str_sub(x,end=7)
#> [1] "Michael" * start 값을 지정해주지 않으면, default 값인 1로 지정됩니다. 즉, str_sub(x,1,7)과 같은 값이 반환됩니다.
str_sub(x,-7)
#> [1] "Carreon" * 음수를 통하여 문자열 끝부터 7번째 오는 문자부터 반환해줍니다.
#Base R
substr(x,1,7)
#> [1] "Michael"

#3) str_c(..., sep='', collapse=NULL)
#문자열을 통합해주는 함수
#sep의 default가 스페이스 공백이 아니므로 base::paste0()와 비슷합니다.
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
#sep와 collapse의 차이는 한 벡터 안에 존재하느냐 아니냐입니다.
str_c("안","녕","하","세","요",sep="_")
#> [1] "안_녕_하_세_요"  
str_c(c("안","녕","하","세","요"),collapse="_")
#> [1] "안_녕_하_세_요"

#4) str_split(string, pattern, n=Inf)
#문자열을 분리해주는 함수--> 결과값은 list입니다.
#base::strsplit(x, split)와 대응하는 함수입니다.
#str_split_fixed()도 있고, 결과값은 matrix
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
#매치하는 곳이 있는지 없는지를 logical 값(True or False)으로 반환해주는 함수
#base::grepl(pattern, x)과 대응
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
#매치하는 곳의 수를 반환해주는 함수
#그 글자가 몇 개 포함되어 있는지 알려줍니다.
str_count(fruit, "p")
#> [1] 2 0 1 3
str_count(fruit, c("a", "b", "p", "p"))
#> [1] 1 1 1 3

#7)str_locate(string, pattern)
#처음으로 매치되는 곳의 start, end 위치를 행렬로 반환해주는 함수
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
#매치된 부분 문자열을 추출하는 함수
#매치되지 않은 요소는 NA로 출력합니다
#base::grep(pattern, x, value=TRUE)와 비슷하나 이 함수는 매치된 요소만 원래의 형태로 돌려줍니다
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
#매치된 부분 문자열을 추출하고 참조를 행렬로 돌려주는 함수
#str_extract 함수의 결과를 1열에 , 각 괄호에 매치된 이후의 결과가 2열 이후에 들어갑니다.
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
#매치되지 않은 부분은 그대로 두고 매치된 부분만 치환하는 함수
#base::sub(매치할 부분,치환할 문자,문자열)와 같은 기능을 합니다.
fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")
#> [1] "-ne apple"     "tw- pears"     "thr-e bananas"
str_replace_all(fruits, "[aeiou]", "-")
#> [1] "-n- -ppl-"     "tw- p--rs"     "thr-- b-n-n-s"

#11)str_trim(string, side="both")
#공백문자를 제거하는 함수
str_trim("        fruits        ", side="both")
#>[1] "fruits" 
Trim = function(x) gsub("^\\s+|\\s+$", "", x)
Trim("        fruits        ")
#>[1] "fruits"

#"lubridate"
#lubri:lubricate(기름을 치다, 기름을 바르다, 원활히 하다)+date
#Lubridate is an R package that makes it easier to work with dates and times 
#1.Installation
install.packages("lubridate")
library(lubridate)

#2.Functions
#1)Parsing dates and times(dates & times 객체 만들기)
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
as.Date("06-04-2011") ### [1] "0006-04-20" (미국식 표현) #Problem

#lubridate package 
ymd("2011/06/04")
## [1] "2011-06-04"
#심볼의 순서를 바꾸어도
mdy("06/04/2011")
## [1] "2011-06-04"
dmy("04/06/2011")
## [1] "2011-06-04"

#lubridate에서의 날짜 양식의 관용
#heterogeneous format(불균일한 양식)에 대한 다양한 준비들이 되어있음
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

##Dates + Times 객체 만들기
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
#조금 더 융통성이 있게 사용할 수 있는 점
ymd_h("2011-06-04 13")
## [1] "2011-06-04 13:00:00 UTC"

#2)Setting and Extracting information
#부분정보를 추출하기 위한 간편 함수들
#함수명칭도 상식적으로 이해하기 쉬운 것들
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

# month, wday 의 경우 label 인자를 가지고 있는데 이를 TRUE 로 설정할 경우
month(ld1, label = T)
## [1] Jun
## 12 Levels: Jan < Feb < Mar < Apr < May < Jun < Jul < Aug < Sep < ... < Dec
wday(ld1, label = T)
## [1] Sat
## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat

#3)Update date-time
#"2011년 6월 4일 13:30:50" 로 저장되어있던 ld1 에 대해 시각(hour)을 10시로 바꾸려면 
hour(ld1) <- 10
ld1
## [1] "2011-06-04 10:30:50 UTC"

#update() 함수를 이용해 10시로 변경된 ld1 을 다시 13로
ld1 <- update(ld1, hour = 13)
ld1
## [1] "2011-06-04 13:30:50 UTC"

#4) Arithmetic with date times
#lubridate 와 같은 패키지를 공부하는 목적 중 가장 중요한 특징
#산술연산에서 사용할 수 있는 패밀리:간편함수마지막에 "s" 가 붙음으로써 쓰임이 달라진 것
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
#lubridate package 에 내장된 데이터셋 lakers 를 이용
#data(lakers)

lakers <- lakers %>% tbl_df
lakers #--> date, time 변수가 서로 나뉘어 있다.
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

#date, time 두변수를 붙인 문자열에 대해 ymd_hm() 함수로 넘긴 후
#time_index 라는 변수에 담고,
#date, time 두 변수를 제외한 것이다.

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

#Using "group by" 월별 평균을 x, y 변수에 대해서 계산:month() 함수를 이용cf) 연별 평균을 계산하고 싶다면 year() 이용
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


#Using "filter" "2008-10-28 12:00:00" 이전의 기간을 서브세팅
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

# "2008-10-28 12:00:00" ~ "2009-03-09 00:33:00" 의 기간에 대해서 서브세팅
lakers %>% 
    filter(time_index >= ymd_hms("2008-10-28 12:00:00"), time_index <= ymd_hms("2009-03-09 00:33:00"))
#interval() 함수와 %within% 연산자를 이용하면 조금 더 직관적인 서브세팅(interval() 함수대신 %--% 연산자를 써도 된다)
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
