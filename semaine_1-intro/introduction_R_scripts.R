
## ----setup, include=FALSE, cache=FALSE-----------------------------------
rm(list=ls())
library(knitr)
options(replace.assign=TRUE, width=70)
opts_chunk$set(fig.path='figure/graphics-', cache.path='cache/graphics-', fig.align='center', dev='tikz', fig.width=5, fig.height=5, fig.show='hold', cache=TRUE, par=TRUE, comment=NA, prompt=FALSE, size='small', message=FALSE, tidy=FALSE, tidy.opts=list(keep.blank.line=FALSE, width.cutoff=60), background=NA)
knit_hooks$set(par=function(before, options, envir){
if (before && options$fig.show!='none') par(mar=c(4,4,.5,.5),cex.lab=1.1,cex.axis=1,mgp=c(2,.7,0),tcl=-.3)
}, crop=hook_pdfcrop)
# render_listings()


## ------------------------------------------------------------------------
age <- c(18, 27, 34, 18, 24, NA, 30, 28, 19, 19)


## ------------------------------------------------------------------------
age


## ------------------------------------------------------------------------
sexe <- c("F", "F", "M", "F", "M", "M", "M", "F", "M", "F")
sexe


## ------------------------------------------------------------------------
length(age)
length(sexe)
mode(age)
mode(sexe)


## ------------------------------------------------------------------------
opin <- c(1, 3, 2, 1, 4, 1, 5, 3, 2, 2)


## ------------------------------------------------------------------------
factor(opin)


## ------------------------------------------------------------------------
opin <- factor(opin, labels=c("Pas du tout d'accord", "Moyennement d'accord", 
                         "Sans Opinion", "Assez d'accord", "Tout a fait d'accord"))
opin
nlevels(opin)


## ------------------------------------------------------------------------
levels(opin)
levels(opin)[4:5] <- "Assez ou tout a fait d'accord"
opin


## ------------------------------------------------------------------------
factor(opin, ordered=TRUE)


## ------------------------------------------------------------------------
sexe <- factor(sexe)
levels(sexe)


## ------------------------------------------------------------------------
sexe <- relevel(sexe, ref="M")
levels(sexe)


## ------------------------------------------------------------------------
age[1]


## ------------------------------------------------------------------------
sexe[c(1, 2, 3)]


## ------------------------------------------------------------------------
is.na(age)


## ------------------------------------------------------------------------
which(is.na(age))


## ------------------------------------------------------------------------
sexe[which(is.na(age))]


## ------------------------------------------------------------------------
sexe[which(age > 25)]


## ------------------------------------------------------------------------
sum(age)


## ------------------------------------------------------------------------
sum(age[-6])


## ------------------------------------------------------------------------
sum(age, na.rm=TRUE)


## ------------------------------------------------------------------------
sum(age^2, na.rm=TRUE)


## ------------------------------------------------------------------------
age[is.na(age)] <- mean(age, na.rm=TRUE)
n <- length(age)      ## nombre d'observations
age - mean(age)       ## écarts à la moyenne
(age - mean(age))^2   ## carrés des écarts à la moyenne
sum((age - mean(age))^2)/(n-1)
sqrt(sum((age - mean(age))^2)/(n-1))


## ------------------------------------------------------------------------
sd(age)


## ------------------------------------------------------------------------
res <- sum(age, na.rm=TRUE)
res


## ------------------------------------------------------------------------
ls()


## ------------------------------------------------------------------------
rm(n, res)
ls()


## ------------------------------------------------------------------------
d <- data.frame(age, sex=sexe)
d


## ------------------------------------------------------------------------
dim(d)
names(d)
str(d)


## ------------------------------------------------------------------------
d$age
d$age[1:2]
d[1:2, 1]


## ------------------------------------------------------------------------
d$var1 <- 1:10
d[1:3,]
d[,3] <- NULL
d[1:3,]
d$opinion <- opin
str(d)


## ------------------------------------------------------------------------
summary(d)


## ----include=FALSE-------------------------------------------------------
if (!file.exists("donnees.txt")) {
    write.table(d, file="donnees.txt", row.names=FALSE)
    write.csv(d, file="donnees.csv", row.names=FALSE)
}


## ----echo=FALSE, results='markup'----------------------------------------
system("head -n 3 donnees.txt")


## ----eval=FALSE----------------------------------------------------------
## d <- read.table("donnees.txt", header=TRUE, sep="", dec=".")


## ----eval=FALSE----------------------------------------------------------
## d <- read.csv("donnees.csv")


## ----eval=FALSE----------------------------------------------------------
## install.packages(c("prettyR", "gplots"), dep="Depends")


## ----echo=FALSE, results='asis'------------------------------------------
toLatex(sessionInfo(), locale=FALSE)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## library(knitr)
## knit("introR.rnw")             ## fournit le fichier LaTeX labs.tex
## system("pdflatex introR.tex")  ## compile le fichier labs.tex en PDF
## purl("introR.rnw")             ## fournit le fichier de commandes labs.R


