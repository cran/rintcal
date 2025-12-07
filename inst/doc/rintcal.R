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
libby <- ccurve("arnold_libby_1951")
plot(libby[,1], libby[,2], xlab="'cal' BP", ylab="C14 BP", pch=20) # plot the radiocarbon dates and their known calendar ages
segments(libby[,1], libby[,2]-libby[,3], libby[,1], libby[,2]+libby[,3]) # radiocarbon error bars
abline(0, 1, lty=2)
ic20 <- ccurve() # add the IntCal20 curve
ic20.pol <- cbind(c(ic20[,1], rev(ic20[,1])), c(ic20[,2]-ic20[,3], rev(ic20[,2]+ic20[,3])))
polygon(ic20.pol, col="darkgreen", border=NA)

## -----------------------------------------------------------------------------
intcal <- intcal.read.data()
IrishOaks <- intcal.data.frames(intcal, taxon="Quercus sp.", country="Ireland")
length(IrishOaks)

## ----fig.width=4, fig.asp=.8--------------------------------------------------
bristle <- intcal.data.frames(intcal, taxon="Pinus longaeva")
bristle_yearly <- bristle[[20]]$data[,c(8,14,15)]
plot(bristle_yearly[,1], bristle_yearly[,2], xlab="cal BP", ylab="C14 BP")
segments(bristle_yearly[,1], bristle_yearly[,2]-bristle_yearly[,3], 
  bristle_yearly[,1], bristle_yearly[,2]+bristle_yearly[,3])

## ----fig.width=5, fig.asp=1---------------------------------------------------
intcal.data(0, 500)

## ----fig.width=5, fig.asp=1---------------------------------------------------
dat <- intcal.data(20e3, 25e3)
unique(dat$set)
dat <- intcal.data(20e3, 25e3, select.sets=c(109, 120), data.cols=c(1,2))

## ----fig.width=5, fig.asp=1---------------------------------------------------
intcal.data(20e3, 25e3, timescale="Delta")

## ----fig.width=5, fig.asp=1---------------------------------------------------
firstrecord <- intcal.extract.record(1)
intcal.plot.record(1)

## -----------------------------------------------------------------------------
mydir <- tempdir()
# new.ccdir(mydir)
mix.ccurves(0.4, cc1="IntCal20", cc2="Marine20", offset=cbind(100, 20), save=TRUE, cc.dir=mydir)

## ----fig.width=4, fig.asp=.8--------------------------------------------------
glued <- glue.ccurves("IntCal20", "NH1")
plot(glued[1:650,1:2], xlab="cal BP", ylab="C-14 BP", pch=".")

