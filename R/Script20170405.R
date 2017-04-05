# 2017-04-05 R-intro.pdf Chapter 08

pois
?dbeta
dnorm(0)
pnorm(0)
1 - pnorm(1.96)
?pnorm
pnorm(1.96, lower.tail=FALSE)
qnorm(0.5)
qnorm(0.975)
format(qnorm(0.975), digits=22)
rnorm(5)
rnorm(5, 10, 1)
x = rnorm(100, 10, 1)
mean(x)
sd(x)

2*pt(-2.43, df = 13)

2*pt(-2.43, df = 1000)

qnorm(0.995)
qf(0.01, 2, 7, lower.tail = FALSE)

?fivenum
faithful
str(faithful)
eruptions
attach(faithful)
eruptions
waiting

stem(waiting)
sort(eruptions)

hist(eruptions)
hist(eruptions, seq(1.6, 5.2, 0.2), prob=TRUE)
lines(density(eruptions, bw=0.1))
rug(eruptions)
?hist
?density
lines(density(eruptions, bw="SJ"))
plot(ecdf(eruptions), do.points=FALSE, verticals=TRUE)
?plot
ecdf(eruptions)
x = ecdf(eruptions)
x
str(x)
x()
plot(ecdf(eruptions), do.points=FALSE)
plot(ecdf(eruptions))
long <- eruptions[eruptions > 3]
x <- seq(3, 5.4, 0.01)
pnorm(x, mean=mean(long), sd=sqrt(var(long)))

?par
x <- rt(250, df = 5)
qqnorm(x); qqline(x)
curve(dnorm, -5, 5)
y = density(x)
lines(y, lty=3)
?ppoints
ppoints(250)
ppoints(10)

qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
windows()
qqplot(qt(runif(250), df = 5), x, xlab = "Q-Q plot for t dsn")
?shapiro.test
?ks.test
?t.test


A = c(79.98, 80.04, 80.02, 80.04, 80.03, 80.03, 80.04, 79.97, 80.05, 80.03, 80.02, 80.00, 80.02)
B = c(80.02, 79.94, 79.98, 79.97, 79.97, 80.03, 79.95, 79.97)
boxplot(A, B)
t.test(A, B)

var.test(A, B)
t.test(A, B, var.equal=TRUE)
wilcox.test(A, B)
plot(ecdf(A), do.points=FALSE, verticals=TRUE, xlim=range(A, B))
plot(ecdf(B), do.points=FALSE, verticals=TRUE, add=TRUE)
ks.test(A, B)

# Chapter 9 Grouping, loops and conditional execution

# { } does grouping
# Usefulness of loops: for >> while >> repeat
for (i in 1:10) {
  print(2*i)
}

# if ~ else ~
if (   ) {
# Statements 1
} else {
# Statements 2
}

if (   ) {
# Statements 1
} else if (   ) {
# Statements 2
} else if (   ) {
# Statements 3
} else {
# Statements 4  
}

   
#
#

# Chapter 10 Writing your own functions

twosam = function(y1, y2) 
{
  n1  = length(y1)
  n2  = length(y2)
  yb1 = mean(y1)
  yb2 = mean(y2)
  s1  = var(y1)
  s2  = var(y2) 
  s   = ((n1 - 1)*s1 + (n2 - 1)*s2)/(n1 + n2 - 2)
  tst = (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2))
  return (tst)
}

x = rnorm(10)
y = rt(10, 5)

twosam(x, y)

T.test = function(y1, y2) 
{
  n1  = length(y1)
  n2  = length(y2)
  yb1 = mean(y1)
  yb2 = mean(y2)
  s1  = var(y1)
  s2  = var(y2) 
  s   = ((n1 - 1)*s1 + (n2 - 1)*s2)/(n1 + n2 - 2)

  tst = (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2))
  DF = n1 + n2 - 2
  p.val = pt(tst, df=DF)
  
  Res = list(tst, DF, p.val)
  names(Res) = c("t", "df", "p-value")
  
  return (Res)
}

T.test(x, y)


bslash = function(X, y) 
{
  X = qr(X)
  return (qr.coef(X, y))
}

regcoeff = bslash(Xmat, yvar)


"%^%" = function(S, pow) with(eigen(S), vectors %*% (abs(values)^pow * t(vectors)))

M = matrix(c(2,1,1,2), nrow=2) ; M
M %^% 0.5
sqrtM = M%^%0.5 ; sqrtM
sqrtM %*% sqrtM





area = function(f, a, b, eps=1.0e-06, lim=10) 
{
  fun1 = function(f, a, b, fa, fb, a0, eps, lim, fun) 
  {
  ## function 'fun1¡¯is only visible inside 'area¡¯
    d = (a + b)/2
    h = (b - a)/4
    fd = f(d)
    a1 = h * (fa + fd)
    a2 = h * (fd + fb)
    if (abs(a0 - a1 - a2) < eps || lim == 0)
      return (a1 + a2)
    else {
      return (fun(f, a, d, fa, fd, a1, eps, lim - 1, fun) + fun(f, d, b, fd, fb, a2, eps, lim - 1, fun))
    }
  }
  fa = f(a)
  fb = f(b)
  a0 = ((fa + fb) * (b - a))/2
  fun1(f, a, b, fa, fb, a0, eps, lim, fun1)
} 

area(dnorm, 0, 1)
integrate(dnorm, 0, 1)
pnorm(1) - pnorm(0)


f = function(x) 
{
  y = 2*x
  print(x)
  print(y)
  print(z)
}

f(1)
z = 3
f(1)


cube = function(n) {
  sq = function() n*n
  n*sq()
}

cube(5)

open.account = function(total) 
{
  list(
    deposit = function(amount) 
    {
      if(amount <= 0)
      stop("Deposits must be positive!\n")
      total <<- total + amount
      cat(amount, "deposited. Your balance is", total, "\n\n")
    },
    withdraw = function(amount) 
    {
      if(amount > total)
      stop("You don¡¯t have that much money!\n")
      total <<- total - amount
      cat(amount, "withdrawn. Your balance is", total, "\n\n")
    },
    balance = function() 
    {
      cat("Your balance is", total, "\n\n")
    }
  )
}

ross = open.account(100)
robert = open.account(200)

ross$balance()
robert$balance()
ross$deposit(50)
ross$balance()
ross$withdraw(500)


