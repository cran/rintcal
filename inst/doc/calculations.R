## ---- include=FALSE-----------------------------------------------------------
require(rintcal)

## -----------------------------------------------------------------------------
pMC.age(150, 1)

## -----------------------------------------------------------------------------
age.pMC(-2300, 40)

## -----------------------------------------------------------------------------
F14C.age(.150, .01)

## -----------------------------------------------------------------------------
age.F14C(-2300, 40)

## -----------------------------------------------------------------------------
F14C.D14C(0.71, t=4000)
D14C.F14C(152, 4000)

## ---- fig.width=4, fig.asp=.8-------------------------------------------------
cc <- ccurve()
cc.Fmin <- age.F14C(cc[,2]+cc[,3])
cc.Fmax <- age.F14C(cc[,2]-cc[,3])
cc.D14Cmin <- F14C.D14C(cc.Fmin, cc[,1])
cc.D14Cmax <- F14C.D14C(cc.Fmax, cc[,1])
par(mar=c(4,3,1,3), bty="l")
plot(cc[,1]/1e3, cc.D14Cmax, type="l", xlab="kcal BP", ylab="")
mtext(expression(paste(Delta, ""^{14}, "C")), 2, 1.7)
lines(cc[,1]/1e3, cc.D14Cmin)
par(new=TRUE)
plot(cc[,1]/1e3, (cc[,2]+cc[,3])/1e3, type="l", xaxt="n", yaxt="n", col=4, xlab="", ylab="")
lines(cc[,1]/1e3, (cc[,2]-cc[,3])/1e3, col=4)
axis(4, col=4, col.axis=4)
mtext("14C kBP", 4, 1.7, col=4)

## -----------------------------------------------------------------------------
contaminate(5000, 20, .01, 1)

## ---- fig.width=6, fig.asp=.8-------------------------------------------------
real.14C <- seq(0, 50e3, length=200)
contam <- seq(0, .1, length=101) # 0 to 10% contamination
contam.col <- rainbow(length(contam))
plot(0, type="n", xlim=c(0, 55e3), xlab="real 14C age", ylim=range(real.14C), ylab="observed 14C age")
for(i in 1:length(contam))
  lines(real.14C, contaminate(real.14C, c(), contam[i], 1, decimals=5), col=contam.col[i])
contam.legend <- seq(0, .1, length=6)
contam.col <- rainbow(length(contam.legend)-1)
text(50e3, contaminate(50e3, c(), contam.legend, 1), 
  labels=contam.legend, col=contam.col, cex=.7, offset=0, adj=c(0,.8))

## ---- fig.width=4, fig.asp=.8-------------------------------------------------
calib.130 <- caldist(130, 20, BCAD=TRUE)
plot(calib.130, type="l")

## -----------------------------------------------------------------------------
hpd(calib.130)

## ---- fig.width=4, fig.asp=.8-------------------------------------------------
calib.2450 <- caldist(2450, 20)
plot(calib.2450, type="l")
points.2450 <- point.estimates(calib.2450)
points.2450
abline(v=points.2450, col=1:4, lty=2)

## ---- fig.width=5, fig.asp=1--------------------------------------------------
calibrate(130,20)

## ---- fig.width=4, fig.asp=1--------------------------------------------------
set.seed(123)
dates <- sort(sample(500:2500,5))
errors <- .05*dates
depths <- 1:length(dates)
my.labels <- c("my", "very", "own", "simulated", "dates")
draw.dates(dates, errors, depths, BCAD=TRUE, labels=my.labels, age.lim=c(0, 1800))

## ---- fig.width=4, fig.asp=1--------------------------------------------------
plot(0, type="n", xlim=c(0, 1800), ylim=c(5,0), xlab="AD", ylab="dates")
draw.dates(dates, errors, depths, BCAD=TRUE, add=TRUE, labels=my.labels, mirror=FALSE)

