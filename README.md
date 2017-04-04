--- 
title: "R Programming - Lecture Notes"
author: "Kyun-Seop Bae"
date: "2017-04-02"
knit: "bookdown::render_book"
documentclass: book
#documentclass: krantz
#bibliography: [book.bib, packages.bib]
bibliography: [packages.bib]
biblio-style: apalike
link-citations: yes
colorlinks: yes
lot: yes
lof: yes
fontsize: 12pt
monofont: "Source Code Pro"
monofontoptions: "Scale=0.7"
site: bookdown::bookdown_site
description: "R Programming - Lecture Notes"
url: 'https\://asancpt.github.io/Rprogramming/'
github-repo: asancpt/Rprogramming
cover-image: images/cover.jpg
---



# Preface {-}

안녕하십니까? 

2017년 1학기 울산대학교 의학과 대학원 수업 `R Programming` 과목 담당교수 배균섭입니다. 

R은 <http://cran.r-project.org> 에서 다운로드받아 설치할 수 있습니다. 
역시 같은 사이트에서 Manual이 나와 있으니 참고하시기 바랍니다. 
구글에서 ‘R Programming pdf’와 같은 키워드로 검색하시면 많은 자료를 보실 수 있습니다.

첨부한 [R.stx](https://groups.google.com/a/acr.kr/group/r/attach/409db97bf453a/R.stx?part=0.1&authuser=0) 파일은 AcroEdit이라는 editor에서 사용할 syntax highlighting용 구문 파일입니다. 
<http://www.acrosoft.pe.kr> 에서 다운로드 받아 설치하시기 바랍니다.
AcroEdit대신 notepad++를 선호하시는 분은 그대로 사용하셔도 됩니다.

저는 RStudio, tinnR 등을 이용해서 강의하지 않습니다만, 필요하신 분은 쓰셔도 괜찮습니다. 
향후 R package 작성을 위해서는 MiKTeX와 Rtools를 설치하십시오.

추가로 말씀드리자면, <http://www.coursera.org> 에 많은 R 강좌가 개설되어 있습니다. 
Specialization course로 들어가면 유로이지만, 
(Specialization course는 여러 개의 과목이 합쳐져 있는 것입니다.) 
개별 과목을 검색해서 들어가면, 무료로도 볼 수 있습니다. 
(대신 시험을 칠 수 없거나, certificate를 받을 수 없습니다.)

좋은 강좌가 많으니 많이 활용하시기 바립니다.

강의 장소에 불편함이 많은 것으로 생각되어, 다음과 같이 Skype 모임을 개설하였습니다. 
사정상 원거리에서 오시기 불편한 분들은 활용하시기 바랍니다. 
출석은 화면을 캡쳐하거나 휴대폰으로 찍은 뒤 sec@acp.kr, shan@acp.kr로 보내주시면 출석으로 인정해 드립니다.

Skype 모임 참가 <https://meet.lync.com/uucp-acp/ksbae/SKGJ3BNQ>

2017년 3월, 배균섭 배상



The online version of this book is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). 

![Creative Commons License](images/by-nc-sa.png)  

## Teaching Assistant {-}

안녕하십니까? 서울아산병원 임상약리학과 전공의 한성필입니다. 
수업과 관련된 여러 제반 업무를 담당하고 있습니다. 
언제든 의문사항 있으면 <r@acr.kr> 로 전체 메일 보내시거나 교수님 <k@acr.kr> 혹은 제 개인 메일 <shan@acp.kr> 로 연락해 주십시오.

교수님께서 세우신 방침에 따라 수업시간에 출석을 부르지 않을 예정입니다. 
수강하시는 화면(Skype)을 휴대폰으로 사진 찍으시거나 강의실의 스크린을 사진으로 촬영하셔서 <sec@acp.kr> / <shan@acp.kr> 로 동시에 보내주시면 됩니다. 
가급적 "2017-03-31 한성필 출석" 과 같은 식의 제목을 유지해 주시면 처리하는데 큰 도움이 될 것 같습니다.

**출석 체크를 위해 전체메일을 사용하지 말아주십시오!**

아울러 수업 중에 사용한 코드/스크립트를 사용하여 R의 패키지인 `bookdown`을 사용해 웹북을 제작 중에 있습니다. [@R-bookdown]
여러분이 읽고 있는 이 책 자체가 R 코드의 일종인 `Rmarkdown`의 결과물이라고 보시면 됩니다. 
[Github 저장소](https://github.com/asancpt/Rprogramming)가 있으니 소스 코드를 보실 수 있습니다. 
누구나 소스를 편집하여 `Pull Request`를 요청할 수 있으므로 혹시 Github를 사용하셔서 웹북의 질을 높이고자 하시는 수강생 선생님들께서는 도움을 주십시오.
혹은 웹북의 각 페이지 아래쪽에 Disqus 창을 달아놓았으므로, 궁금한 점을 메모로 남겨주셔도 좋습니다. 

감사합니다.

2017년 3월, 한성필 올림



## FAQ {-}





> Q. 미국학회 참석으로 수업시간이 귀국행 비행기 기내에 있을거같아 출석이 안될것 같습니다. 방법이 있을지요?

결석 사유서를 제출해 주시면 출석 처리 하겠습니다. [대학원 홈페이지 참고 바랍니다.](http://www.medulsan.ac.kr/graduate/?mid=72&curpage=files)  이 링크로 들어가시면 가장 위에 있습니다. (`결석사유서.hwp`) 
참고로 수업 영상은 녹화하여 Youtube에 비공개 링크를 만들 예정이라서 추후에 관련 영상을 시청할 수 있을 것 같습니다.
결석사유서를 제출한다고 100% 출석이 인정되는 것은 아닙니다. 
이것이 기본적으로는 offline강의이기 때문에 강의시간에 강의실에 있든지, 또는 온라인으로 접속해 있어야 합니다. 
출석사유서를 제출하거나, 추후 동영상 시청을 해서 그 증거(사진)을 제출하는 경우에 감점을 줄여드릴 수 있습니다. 예를 들어, 결석시에는 2점 감점인데, 결석사유서를 제출하면 1점만 감점한다는지, 동영상을 보면 0.5점만 감점한다는지 하는 것입니다. 
결석 사유서 제출 시 출석 처리 원칙에 대한 설명을 드리오니, 참고하시길 바랍니다.

> Q. 스카이프를 한번도 안써봐서 이참에 사용법을 배우고있는데, 수업시작시에 상대방을 어떻게 검색해서 들어가면 될지 알려주시면 감사하겠습니다.

> Q. 온라인 수강시 접속하는  스카이프 주소는 무엇인지요?

<https://meet.lync.com/uucp-acp/ksbae/SKGJ3BNQ>

Chrome 등 웹브라우저에서 위 주소를 입력하면 직접 대화방으로 연결됩니다. (검색할 필요 없습니다.) 처음 설치시에는 Add-on이 설치될 수 있습니다. MacOS Sierra, Win7, Win10에서 Chrome, Internet Explorer 등을 사용하여 테스트해 보았고 모두 잘 동작하였습니다. 대부분의 경우 Skype For Business 계정이 없을 것으로 생각되는데  따로 로그인할 필요 없습니다.

수업 시작 30분 전부터 대화방을 개설해 놓도록 하겠습니다.

<https://groups.google.com/a/acr.kr/d/msg/r/nUkrE37W2kQ/waG-FkM_BgAJ> 교수님께서 처음 보낸 메일을 참고해 주십시오.

> Q. 앞으로 수업은 지난 첫수업처럼 계속 온라인 수강이 가능한 것인가요?

네, 계속 온라인으로 가능합니다. 

> Q. 저도 웹캠을 설치하여야 하여야 하나요?

설치할 필요 없습니다. 오히려 수강자의 웹캠의 전원을 꺼두시길 권고드립니다.

> Q. 수강전 온라인 강의 테스트 해볼 수 있나요?

수업 시작 30분 전부터 대화방을 개설하여 놓도록 하겠습니다.

> Q. 과제물이 있다고 들었는데 언제 assign하게 되는지요?

과제물은 빨라야 5주차 이후에 나갑니다.

> Q. Coursera 강의를 듣고 증명서를 내면 출석을 얼마나 커버할 수 있을런지요?

Coursera는 출석 커버보다는 grade를 올려 주기 위한 것입니다. 출석은 Skype로 커버해야 합니다. 출석의 성적 반영비율은 25%이지만, 규정상 4회 이상 결석이면 성적이 나갈 수 없습니다.

> Q. 첫 수업 때, certification 관련 말씀을 하셨는데, 정확히 coursera 사이트에서 어떤 것을 듣고, 제출을 해야하는지 궁금합니다.
(비슷한 내용이 많아, 어떤것을 들어야하는지 헷갈립니다.)

Coursera는 꼭 어느 것을 들어야 하는 것은 아니고, R programming과 관련된 것이라면 자유로이 골라서 들으면 됩니다. 대표적인 두 가지만 들자면 다음과 같습니다.
 
- <https://www.coursera.org/learn/r-programming>
- <https://www.coursera.org/learn/r-programming-environment>
 