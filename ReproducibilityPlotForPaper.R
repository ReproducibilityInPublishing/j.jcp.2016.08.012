reproducibility_data = read.csv("./reproducibility.dat")
png("ReproducibilityPlotForPaper.png", height=2.5, width=5, units="in", res=300)
par(mar=c(2,2,1,1))
plot(reproducibility_data$Time, reproducibility_data$Percentage, 's', ylim=c(0,100), xlab="", ylab="")
