R Programming 2nd Assignments
================
Sungpil Han
2017-07-04 15:24:41

Introduction
------------

한학기 동안 고생 많으셨습니다.

두번째 과제의 제출 현황을 정리하였습니다. 성공적으로 설치된 R Packages의 목록이 나와있습니다.

### 목록 생성 방법

-   `DESCRIPTION` 파일 정보를 읽어 인용을 위한 `bibtex`파일을 생성해 주는 `knitr::write_bib()` (Xie 2017)와 `RefManageR::ReadBib()` (McLean 2016) 함수를 사용하여 나타내었습니다.

List of Submitted R Packages
----------------------------

An alphabetical order by the last name as of 2017-07-04 15:24:44

\[1\] D. Cho. *imageML: Basic image processing and Machine Learning using MNIST data (Hand written digit) for R*. R package version 0.1.0. 2017.

\[2\] J. Choi. *unicox: Univariate anlaysis by Cox model*. R package version 0.0.0.9000. 2017. &lt;URL: <https://github.com/asancpt/unicox>&gt;.

\[3\] S. Choi. *CauseOfDeathCounter: Population counter for selected cause of death (Rep. of Korean database.)*. R package version 0.0.2. 2017.

\[4\] duguhong. *doctor: calldoctor*. R package version 0.1.0. 2017.

\[5\] S. Han. *cats: A Test of Loving Cats or Not*. R package version 0.0.1. 2017. &lt;URL: <https://github.com/shanmdphd/cats>&gt;.

\[6\] S. Han. *glasgowcoma: A Reference of Glasgow Coma Scale*. R package version 0.0.1. 2017. &lt;URL: <https://github.com/shanmdphd/glasgowcoma>&gt;.

\[7\] W. wrote it. *mDense: What the Package Does (Title Case)*. R package version 0.1.0. 2017.

\[8\] W. Ji. *bmi: BMI calculator*. R package version 0.0.0.9000. 2017.

\[9\] H. Ju. *Ttest: t-test, useful etc*. R package version 1.0. 2017.

\[10\] E. Kang. *sds: SDS*. R package version 0.1.0. 2017.

\[11\] M. C. Kang. *abgatool: Diagnostic tool of acid-base disorders for R*. R package version 1.0.0. 2017.

\[12\] S. Kang. *uconv: Unit converter*. R package version 0.1.0. 2017.

\[13\] J. Kim. *mrate: Currency Converter*. R package version 0.1.0. 2017.

\[14\] J. Kim. *qSOFA: Calculate qSOFA (Quick Sepsis-Related Organ Failure Assessment) Following Sepsis Guideline 3*. R package version 0.1.0. 2017. &lt;URL: <https://github.com/asancpt/qSOFA>&gt;.

\[15\] Y. Kim. *VariousIP: VariousIP for R*. R package version 0.1.0. 2017.

\[16\] J. H. Kwon. *MyUtil: My Utilities for R*. R package version 0.1.0. 2017.

\[17\] S. Kyu. *Picturepackage: My picture automations for R*. R package version 0.1.0. 2017.

\[18\] F. Last. *MedAd: What the Package Does (one line, title case)*. R package version 0.0.0.9000. 2017.

\[19\] F. Last. *tempConvert: What the Package Does (one line, title case)*. R package version 0.0.0.9000. 2017.

\[20\] chang hoon lee. *MyUtil: My Utility for R*. R package version 0.1.0. 2017.

\[21\] si hyeon Lee. *findOutlier: A package I made*. R package version 1.0. 2017.

\[22\] E. Lee. *lottery: This package is for homework.....* R package version 0.0.0.9000. 2017.

\[23\] G. Lee. *ECOG: ECOG*. R package version 0.1.0. 2017.

\[24\] Y. J. Lee. *Sunscreen: Amount of sunscreen you should apply*. R package version 0.1.0. 2017.

\[25\] D. Oh. *curb65: This function reports CURB65.* R package version 0.0.0.9000. 2017.

\[26\] G. Park. *MyFunc: My function for R*. R package version 1.0.0. 2017.

\[27\] J. Park. *JHImageProcessingR: Basic Image processing In R*. R package version 0.1.0. 2017.

\[28\] person). *SurvModelComp: Survival model comparison by bootstrapping*. R package version 0.1.0. 2017.

\[29\] G. Seo. *windex: Weight Indices*. R package version 0.1.0. 2017.

Received packages: `IOLcalculator`, `hw`

Feedback
--------

-   R 프로그래밍에서 어려운 한 단계를 넘어선 것을 축하드립니다.
-   제출하셨으나 목록에 자신의 패키지가 보이지 않는 분은 2017-06-21 18:00 이후 <shan@acp.kr> 로 알려주세요.

### 팁

-   목록의 개발자 이름, 패키지 이름/설명/버젼 등은 `DESCRIPTION` 파일 혹은 `package.Rd` 파일에 에 적힌 것을 그대로 읽어온 것입니다. 다른 사람들이 여러분의 패키지를 사용하게 되거나 인용하게 될 때 표시되는 (사람으로 비유하면 얼굴과 같은) 정보이므로 신중하게 정하는 것이 좋습니다.
-   패키지 title은 title (proper) case로 작성되어야 합니다. `tools::toTitleCase()` 함수를 사용해도 됩니다.

``` r
# Conversion to the title (proper) case
tools::toTitleCase("This package title should be corrected")
```

    ## [1] "This Package Title Should be Corrected"

-   패키지를 [CRAN](https://cran.r-project.org/web/packages/index.html) 혹은 [Github](https://github.com)나 [Bitbucket](https://bitbucket.org/) 등에 올린다면 다른 사람들이 쉽게 업데이트 할 수 있으므로 코드를 다른 사람과 공유 시 여러 장점을 갖게 됩니다.

### Suggested Reading Materials

무료로 볼 수 있는 html 자료입니다.

-   [R packages](http://r-pkgs.had.co.nz/) : R 패키지를 만드는 방법에 대해 쉽게 설명되어 있습니다.
-   [Writing an R package from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) : 블로그 포스트로서 아주 단순한 패키지를 만드는데 참고하시면 됩니다.
-   [R package primer](http://kbroman.org/pkg_primer/) : 비교적 쉽게 서술되어 있습니다.

References
----------

McLean, Mathew W. 2016. *RefManageR: Straightforward ’Bibtex’ and ’Biblatex’ Bibliography Management*. <https://CRAN.R-project.org/package=RefManageR>.

Xie, Yihui. 2017. *Knitr: A General-Purpose Package for Dynamic Report Generation in R*. <https://CRAN.R-project.org/package=knitr>.
