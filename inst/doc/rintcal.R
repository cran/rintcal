## ----eval=FALSE---------------------------------------------------------------
# install.packages('rintcal')

## ----eval=FALSE---------------------------------------------------------------
# update.packages()

## -----------------------------------------------------------------------------
library(rintcal)

## -----------------------------------------------------------------------------
ic20 <- ccurve()
head(ic20)
tail(ic20)

## ----eval=FALSE---------------------------------------------------------------
# ?ccurve

## -----------------------------------------------------------------------------
list.ccurves()

## ----fig.width=5, fig.asp=1---------------------------------------------------
libby <- read.table(file.path(system.file(package = 'rintcal'), "extdata/Arnold_Libby_1951.txt"), header=T, sep=",")
plot(libby[,2], libby[,4], xlab="'cal' BP", ylab="C14 BP", pch=20) # plot the radiocarbon dates and their known calendar ages
segments(libby[,2]-libby[,3], libby[,4], libby[,2]+libby[,3], libby[,4]) # calendar error bars (not all are quantified)
segments(libby[,2], libby[,4]-libby[,5], libby[,2], libby[,4]+libby[,5]) # radiocarbon error bars
abline(0, 1, lty=2)
ic20 <- ccurve() # add the IntCal20 curve
ic20.pol <- cbind(c(ic20[,1], rev(ic20[,1])), c(ic20[,2]-ic20[,3], rev(ic20[,2]+ic20[,3])))
polygon(ic20.pol, col="darkgreen", border=NA)

## -----------------------------------------------------------------------------
intcal <- intcal.read.data()
IrishOaks <- intcal.data.frames(intcal, taxon="Quercus sp.", country="Ireland")
length(IrishOaks)

## ----fig.width=4, fig.asp=.8--------------------------------------------------
Bristle <- intcal.data.frames(intcal, taxon="Pinus longaeva")
Bristle_yearly <- Bristle[[20]]$data[,c(8,14,15)]
plot(Bristle_yearly[,1], Bristle_yearly[,2], xlab="cal BP", ylab="C14 BP")
segments(Bristle_yearly[,1], Bristle_yearly[,2]-Bristle_yearly[,3], Bristle_yearly[,1], Bristle_yearly[,2]+Bristle_yearly[,3])

## ----fig.width=5, fig.asp=1---------------------------------------------------
intcal.data(0, 500)

## ----fig.width=5, fig.asp=1---------------------------------------------------
dat <- intcal.data(20e3, 25e3)
unique(dat$set)
dat <- intcal.data(20e3, 25e3, select.sets=c(109, 120), data.cols=c(1,2))

## ----fig.width=5, fig.asp=1---------------------------------------------------
intcal.data(20e3, 25e3, realm="d")

## -----------------------------------------------------------------------------
mydir <- tempdir()
# new.ccdir(mydir)
mix.ccurves(0.4, cc1="IntCal20", cc2="Marine20", offset=cbind(100, 20), save=TRUE, cc.dir=mydir)

## ----fig.width=4, fig.asp=.8--------------------------------------------------
glued <- glue.ccurves("IntCal20", "NH1")
plot(glued[1:650,1:2], xlab="cal BP", ylab="C-14 BP", pch=".")

