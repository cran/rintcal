## ---- eval=FALSE--------------------------------------------------------------
#  install.packages('rintcal')

## ---- eval=FALSE--------------------------------------------------------------
#  update.packages()

## -----------------------------------------------------------------------------
library(rintcal)

## -----------------------------------------------------------------------------
ic20 <- ccurve()
head(ic20)

## ---- eval=FALSE--------------------------------------------------------------
#  ?ccurve

## -----------------------------------------------------------------------------
list.ccurves()

## -----------------------------------------------------------------------------
mix.ccurves(0.4, cc1="IntCal20", cc2="Marine20", offset=c(100, 20))

## ---- fig.width=4, fig.asp=.8-------------------------------------------------
glued <- glue.ccurves("IntCal20", "NH1")
plot(glued[1:650,1:2], xlab="cal BP", ylab="C-14 BP", pch=".")
