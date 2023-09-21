

quant_graph = function(datax, quants, graph_name){
  n = nrow(datax)
  tiles = matrix(0,n,quants+1)
  for(i in 1:n){
    tiles[i,] = quantile(datax[i,], probs = seq(0,1, 1/quants), na.rm = TRUE)
  }
  m = ncol(tiles)-1
  #maybe can adjust color pallete to have variable input
  plotcol = colorRampPalette(c("red","blue"))(m+1)
  plot(tiles[,1], type = "b", ylim = c(min(na.omit(datax)),max(na.omit(tiles))), xlab = "Time", ylab = "Value", main = graph_name, col = plotcol[1])
  for (i in 1:m) {
    lines(tiles[,i+1], type = "b", col = plotcol[i+1])
  }
  #return quantiles incase it is needed elsewhere
  return(tiles)
}


#All above data shows no trend of particular interest
#Check state level DID
#--------------------------
#STATE LEVEL
#--------------------------
mergedf.s.did = mergedf.s[order(mergedf.s$state),]

for(x in 1:47){
mergedf.s.did[,5+x] = as.numeric(as.character(mergedf.s.did[,5+x]))
}

#must use lag as dif is messing up somehow
mergedf.s.did = mergedf.s.did %>%
  group_by(state) %>%
  mutate(total.housing.dif = total.housing - lag(total.housing),
         employable.pop.dif = employable.pop - lag(employable.pop),
         total.pop.labor.dif = total.pop.labor - lag(total.pop.labor),
         employed.pop.labor.dif = employed.pop.labor - lag(employed.pop.labor),
         total.income.benefits.dif = total.income.benefits - lag(total.income.benefits),
         inc.0.10.dif = inc.0.10 - lag(inc.0.10),
         inc.10.15.dif = inc.10.15 - lag(inc.10.15),
         inc.15.25.dif = inc.15.25 - lag(inc.15.25),
         inc.25.35.dif = inc.25.35 - lag(inc.25.35),
         inc.35.50.dif = inc.35.50 - lag(inc.35.50),
         inc.50.75.dif = inc.50.75 - lag(inc.50.75),
         inc.75.100.dif = inc.75.100 - lag(inc.75.100),
         inc.100.150.dif = inc.100.150 - lag(inc.100.150),
         inc.150.200.dif = inc.150.200 - lag(inc.150.200),
         inc.200.abv.dif = inc.200.abv - lag(inc.200.abv),
         total.educ.dif = total.educ - lag(total.educ),
         educ.9th.dif = educ.9th - lag(educ.9th),
         educ.no.dip.dif = educ.no.dip - lag(educ.no.dip),
         educ.dip.dif = educ.dip - lag(educ.dip),
         educ.col.no.deg.dif = educ.col.no.deg - lag(educ.col.no.deg),
         educ.associate.dif = educ.associate - lag(educ.associate),
         educ.bachelor.dif = educ.bachelor - lag(educ.bachelor),
         educ.graduate.deg.dif = educ.graduate.deg - lag(educ.graduate.deg),
         owner.dif = owner - lag(owner),
         renter.dif = renter - lag(renter),
         owner.hh.size.dif = owner.hh.size - lag(owner.hh.size),
         renter.hh.size.dif = renter.hh.size - lag(renter.hh.size),
         owner.percent = owner/(owner + renter),
         renter.percent = renter/(owner + renter),
         year = as.factor(year),
         over.18.pop.dif = over.18.pop - lag(over.18.pop),
         #create new share metrics due to advisor feedback for better comparative analysis
         educated.pop =  educ.9th + educ.no.dip + educ.dip + educ.col.no.deg + educ.associate + educ.bachelor + educ.graduate.deg   ,
         educ.9th.share = educ.9th/educated.pop,
         educ.no.dip.share = educ.no.dip/educated.pop,
         educ.dip.share = educ.dip/educated.pop,
         educ.col.no.deg.share = educ.col.no.deg/educated.pop,
         educ.associate.share = educ.associate/educated.pop,
         educ.bachelor.share = educ.bachelor/educated.pop,
         educ.gradaute.share = educ.graduate.deg/educated.pop,
         housing.pop.ratio = total.housing/over.18.pop,
         #And I actually need to pull more data to do these
         working.age = over.18.pop - over.65.pop,
         housing.pop.working.age = total.housing/working.age,
         #houding.pop.total = total.housing/population
         #calculate gini, income values taking median of range, value in thousands, assume 200,000 is just 200
         owner.percent.lag = lag(owner.percent),
         GINI = GINI*100,
         lagged.GINI = lag(GINI),
         income.gap = fifth.quant - first.quant,
         log.income.gap = log(income.gap)
         ,dif.income.gap = log.income.gap - lag(log.income.gap),
         income.gap.80.5 = top5 - first.quant,
         log.income.gap.80.5 = log(income.gap.80.5),
         dif.income.gap.80.5 = log.income.gap.80.5 - lag(log.income.gap.80.5),
         mort.20.30.percent = mort.20.30/mort.20,
         mort.20.35.30.percent = mort.20.35.30/mort.20.35,
         mort.35.50.30.percent = mort.35.50.30/mort.35.50,
         mort.50.75.30.percent = mort.50.75.30/mort.50.75,
         mort.75.30.percent = mort.75.30/mort.75,
         lag.mort.20 = mort.20.30.percent - lag(mort.20.30.percent),
         lag.mort.20.35 = mort.20.35.30.percent - lag(mort.20.35.30.percent),
         lag.mort.35.50 = mort.35.50.30.percent - lag(mort.35.50.30.percent),
         lag.mort.50.75 = mort.50.75.30.percent - lag(mort.50.75.30.percent),
         south = if_else(county == 'Arizona' | county == 'New Mexico' | county == 'Texas'
                         | county == 'Oklahoma' | county == 'Arkansas' | county == 'Lousiana'
                         | county == 'Mississippi' | county == 'Alabama' | county == 'Georgia'
                         | county == 'Florida' | county == 'South Carolina' | county == 'Tehnnessee'
                         | county == 'North Carolina' | county == 'Kentucky',
                         1, 0),
         did.GINI = lagged.GINI * south,
         did.housing.pop.ratio = housing.pop.ratio * south,
         did.80.20 = log.income.gap * south,
         did.80.5 = log.income.gap.80.5 * south,
         twentytwo = year == 2022,
         did.GINI.2022 = lagged.GINI*south * twentytwo,
         did.housing.pop.2022 = housing.pop.ratio * south * twentytwo,
         did.80.20.2022 = log.income.gap * south * twentytwo,
         did.80.5.2022 = log.income.gap.80.5 * south * twentytwo
         ) %>%
  ungroup


#remove Puerto Rico
analysis.set = mergedf.s.did[1:612,]

#remove DC
analysis.set = analysis.set[-(97:108),]
analysis.set = analysis.set[order(analysis.set$year),]
#-------------
#TRUE VALUES BECAUSE I FOUND THOSE
#-------------------


#alt DID spec
AR.lag.reg3.did = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.reg3.did)




AR.lag.reg2.did = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.reg2.did)

AR.lag.reg.did = lm(owner.percent ~ lagged.GINI +  did.GINI + housing.pop.ratio +did.housing.pop.ratio + year + county
                ,data = analysis.set)

summary(AR.lag.reg.did)

working.pop.reg = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio +did.housing.pop.ratio + year + county
                     ,data = analysis.set)

summary(working.pop.reg)

#8020 alt
AR.lag.8020 = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.8020)

AR.lag.8020.2 = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                   ,data = analysis.set)

summary(AR.lag.8020.2)

AR.lag.8020.3 = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + year + county
                   ,data = analysis.set)

summary(AR.lag.8020.3)


#805 alt
#Use 80-5 measure to test inequality at extremes
AR.lag.805 = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                ,data = analysis.set)

summary(AR.lag.805)

AR.lag.805.2 = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                  ,data = analysis.set)

summary(AR.lag.805.2)

AR.lag.805.3 = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + year + county
                  ,data = analysis.set)

summary(AR.lag.805.3)
#---------------
#STATE LEVEL MORTGAGE COST (MAY INCLUDE AR TERM LATER)
#---------------
#20.000

m20.gini = lm(mort.20.30.percent ~ lagged.GINI + did.GINI + lag.mort.20 + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size  + year + county
                     ,data = analysis.set)

summary(m20.gini)

m20.8020 = lm(mort.20.30.percent ~ log.income.gap + did.80.20 + lag.mort.20 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m20.8020)

m20.805 = lm(mort.20.30.percent ~ log.income.gap.80.5 + did.80.5 + lag.mort.20 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m20.805)


#20.000-35.000
m20.35.gini = lm(mort.20.35.30.percent ~ lagged.GINI + did.GINI + lag.mort.20.35 + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
              ,data = analysis.set)

summary(m20.35.gini)

m20.35.8020 = lm(mort.20.35.30.percent ~ log.income.gap + did.80.20 + lag.mort.20.35 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
              ,data = analysis.set)

summary(m20.35.8020)

m20.35.805 = lm(mort.20.35.30.percent ~ log.income.gap.80.5 + did.80.5 + lag.mort.20.35 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
             ,data = analysis.set)

summary(m20.35.805)

#35.000-50.000
m35.50.gini = lm(mort.35.50.30.percent ~ lagged.GINI + did.GINI + lag.mort.35.50 + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.gini)

m35.50.8020 = lm(mort.35.50.30.percent ~ log.income.gap + did.80.20 + lag.mort.35.50 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.8020)

m35.50.805 = lm(mort.35.50.30.percent ~ log.income.gap.80.5 + did.80.5 + lag.mort.35.50 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m35.50.805)

#50.000-75.000

m50.75.gini = lm(mort.50.75.30.percent ~ lagged.GINI + did.GINI + lag.mort.50.75 + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m50.75.gini)

m50.75.8020 = lm(mort.50.75.30.percent ~ log.income.gap + did.80.20 + lag.mort.50.75 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m50.75.8020)

m50.75.805 = lm(mort.50.75.30.percent ~ log.income.gap.80.5 + did.80.5 + lag.mort.50.75 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m50.75.805)


#Check with two level did
m35.50.gini.2022 = lm(mort.35.50.30.percent ~ lagged.GINI + did.GINI + did.GINI.2022 + lag.mort.35.50 + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.gini.2022)

m35.50.8020.2022 = lm(mort.35.50.30.percent ~ log.income.gap + did.80.20 + did.80.20.2022 + lag.mort.35.50 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.8020.2022)

m35.50.805.2022 = lm(mort.35.50.30.percent ~ log.income.gap.80.5 + did.80.5 + did.80.5.2022 + lag.mort.35.50 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m35.50.805.2022)
#------------------
#Some more visual analysis
#---------------


plot(analysis.set$owner.percent, analysis.set$Gini.estimate.low, xlab = "Ownership Percentage", ylab = "GINI Coefficient", main = "Low GINI Estimate")
plot(analysis.set$owner.percent, analysis.set$Gini.estimate.mid, xlab = "Ownership Percentage", ylab = "GINI Coefficient", main = "Medium GINI Estimate")
plot(analysis.set$owner.percent, analysis.set$Gini.estimate.high, xlab = "Ownership Percentage", ylab = "GINI Coefficient", main = "High GINI Estimate")

plot(owner.percent,owner.percent.lag)


#kernal plotter function
kernal.plotter = function(x, y, mains, xlabs, ylabs = 'Density'){
  plot(density(na.omit(x[y$year == 2010])), col = 1, main = mains, ylab = ylabs, xlab = xlabs
       #, ylim = c(0,0.25)
       )
  lines(density(na.omit(x[y$year == 2011])), col = 2)
  lines(density(na.omit(x[y$year == 2012])), col = 3)
  lines(density(na.omit(x[y$year == 2013])), col = 4)
  lines(density(na.omit(x[y$year == 2014])), col = 5)
  lines(density(na.omit(x[y$year == 2015])), col = 6)
  lines(density(na.omit(x[y$year == 2016])), col = 7)
  lines(density(na.omit(x[y$year == 2017])), col = 8)
  lines(density(na.omit(x[y$year == 2018])), lty = 2, col = 9)
  lines(density(na.omit(x[y$year == 2019])), lty = 2, col = 10)
  lines(density(na.omit(x[y$year == 2021])), lty = 2, col = 11)
  lines(density(na.omit(x[y$year == 2022])), lty = 2, col = 12)
  
  legend(x = "topright", legend = c('2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2021', '2022'),
         col = c(1,2,3,4,5,6,7,8,9,10,11,12), lty = c(1,1,1,1,1,1,1,1,2,2, 2, 2),
         lwd = 2)
}
kernal.plotter(analysis.set$GINI, analysis.set, "Gini True", "Coefficient", 'Density')

kernal.plotter(analysis.set$log.income.gap, analysis.set, "Log Income 80/20 Gap", "Coefficient", 'Density')
mean(analysis.set$log.income.gap[analysis.set$year == 2010]) - mean(analysis.set$log.income.gap[analysis.set$year == 2022])

kernal.plotter(analysis.set$log.income.gap.80.5, analysis.set, "Log Income 80/5 Gap", "Coefficient", 'Density')
mean(analysis.set$log.income.gap.80.5[analysis.set$year == 2010]) - mean(analysis.set$log.income.gap.80.5[analysis.set$year == 2022])

kernal.plotter(analysis.set$mort.20.30.percent, analysis.set, "20k Mortgage or Less Housing Instability", "Coefficient", 'Density')

kernal.plotter(analysis.set$mort.20.35.30.percent, analysis.set, "20k-35k Mortgage Housing Instability", "Coefficient", 'Density')

kernal.plotter(analysis.set$mort.35.50.30.percent, analysis.set, "35k-50k Mortgage Housing Instability", "Coefficient", 'Density')

kernal.plotter(analysis.set$mort.50.75.30.percent, analysis.set, "50k-75k Mortgage Housing Instability", "Coefficient", 'Density')

kernal.plotter(analysis.set$Gini.estimate.low, "Gini Estimate Low", "Coefficient", 'Density')

kernal.plotter(analysis.set$Gini.estimate.mid, "Gini Estimate Medium", "Coefficient", 'Density')

kernal.plotter(analysis.set$Gini.estimate.high, "Gini Estimate High", "Coefficient", 'Density')

kernal.plotter(analysis.set$housing.pop.working.age, analysis.set, "Housing by working age", "Percentage")

kernal.plotter(analysis.set$housing.pop.ratio, analysis.set, "Housing by population", "Percentage")

kernal.plotter(analysis.set$owner.percent, analysis.set, "Owner Percentage", "Percentage")

kernal.plotter(analysis.set$first.quant, analysis.set, "Owner Percentage", "Percentage")

kernal.plotter(analysis.set$fifth.quant, analysis.set, "Owner Percentage", "Percentage")

kernal.plotter(analysis.set$top5, analysis.set, "Owner Percentage", "Percentage")


lig.mean = mean(analysis.set$log.income.gap)
lig.sd = sd(analysis.set$log.income.gap)
analysis.set$county[analysis.set$log.income.gap > lig.mean+2*lig.sd]


#Check Residuals
#I can't function to auto add AB lines every year
#alternative

plot(resid(AR.lag.reg.did), type = 'l', col = 'blue', main = 'DID Only Gini Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.reg2.did), type = 'l', col = 'blue', main = 'AR Term Gini Homeonwership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.reg3.did), type = 'l', col = 'blue', main = 'Houshold Size Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')



plot(resid(AR.lag.8020.3), type = 'l', col = 'blue', main = 'DID Only 80/20 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.8020.2), type = 'l', col = 'blue', main = 'AR Term 80/20 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.8020), type = 'l', col = 'blue', main = 'Houshold Size 80/20 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')



plot(resid(AR.lag.805.3), type = 'l', col = 'blue', main = 'DID Only 80/5 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.805.2), type = 'l', col = 'blue', main = 'AR Term 80/5 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(AR.lag.805), type = 'l', col = 'blue', main = 'Houshold Size 80/5 Homeownership Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')




plot(resid(m35.50.8020), type = 'l', col = 'blue', main = '35,000 - 50,000 Mortgage 80/20 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m35.50.805), type = 'l', col = 'blue', main = '35,000 - 50,000 Mortgage 80/5 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m35.50.gini), type = 'l', col = 'blue', main = '35,000 - 50,000 Mortgage Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')


#check other mortgages change titles later

plot(resid(m20.gini), type = 'l', col = 'blue', main = '20,000 or Less Mortgage Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m20.8020), type = 'l', col = 'blue', main = '20,000 or Less Mortgage 80/20 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m20.805), type = 'l', col = 'blue', main = '20,000 or Less Mortgage 80/5 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')


plot(resid(m20.35.gini), type = 'l', col = 'blue', main = '20,000 - 535,000 Mortgage Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m20.35.8020), type = 'l', col = 'blue', main = '20,000 - 535,000 Mortgage 80/20 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m20.35.805), type = 'l', col = 'blue', main = '20,000 - 535,000 Mortgage 80/5 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')


plot(resid(m50.75.gini), type = 'l', col = 'blue', main = '50,000 - 75,000 Mortgage Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m50.75.8020), type = 'l', col = 'blue', main = '50,000 - 75,000 Mortgage 80/20 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')

plot(resid(m50.75.805), type = 'l', col = 'blue', main = '50,000 - 75,000 Mortgage 80/5 Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')


sd(resid(m35.50.gini))
sd(resid(m35.50.8020))
sd(resid(m35.50.805))

#residuals of last period
sd(m35.50.gini$residuals[501:550])
sd(m35.50.8020$residuals[501:550])
sd(m35.50.805$residuals[501:550])

#residuals of not last period
sd(m35.50.gini$residuals[1:500])
sd(m35.50.8020$residuals[1:500])
sd(m35.50.805$residuals[1:500])

lmtest::bptest(m35.50.gini)
lmtest::bptest(m35.50.8020)
lmtest::bptest(m35.50.805)

sd(m35.50.805.2022$residuals)
sd(m35.50.8020.2022$residuals)

#fill this out
plot(m35.50.805.2022$residuals, type = 'l', col = 'blue', main = '35,000 - 50,000 Mortgage Gini Residuals', xlab = 'Period', ylab = 'Residual')
abline(v = c(50,100, 150, 200, 250, 300, 350, 400, 450, 500), lty = 2, col = 'red')
#---------------
#Publish Results
#---------------

#owner % regressions
models = list(AR.lag.reg.did,  AR.lag.reg2.did, AR.lag.reg3.did)
#owner regressions
models2 = list(reg19, reg24,  reg26, reg26.robust)

stargazer(models, title = 'Ownership % by GINI', column.labels = c('DID only', 'AR Term', "Household Size"),
                    type = "text", omit = c("year","county") , out = "ginipercent.txt")

stargazer(models2, title = 'Number of Owners Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults2.txt")


stargazer(models, title = 'Ownership % Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults1.pdf")

stargazer(models2, title = 'Number of Owners Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults2.txt")

model8020 = list(AR.lag.8020.3, AR.lag.8020.2, AR.lag.8020)

stargazer(model8020, title = "Ownership % by 80/20 Income Inequality", column.labels = c('DID Only', 'AR Term', 'Household Size'),
          type = "text", omit = c("year","county") , out = "8020percent.txt")

model805 = list(AR.lag.805.3, AR.lag.805.2, AR.lag.805)

stargazer(model805, title = "Ownership % by 80/5 Income Inequality", column.labels = c('DID Only', 'AR Term', 'Household Size'),
          type = "text", omit = c("year","county") , out = "805percent.txt")

#Mortgage regressions
m20 = list(m20.gini, m20.8020, m20.805)
m2035 = list(m20.35.gini, m20.35.8020, m20.35.805)
m3550 = list(m35.50.gini, m35.50.8020, m35.50.805)
m5075 = list(m50.75.gini, m50.75.8020, m50.75.805)


stargazer(m20, title = 'Under 20k Mortgage, Housing Insecurity', column.labels = c('Gini', '80/20', '80/5'),
          type = "text", omit = c("year","county"), out = "m20.txt")

stargazer(m2035, title = '20k-35k Mortgage, Housing Insecurity', column.labels = c('Gini', '80/20', '80/5'),
          type = "text", omit = c("year","county"), out = "m2035.txt")

stargazer(m3550, title = '35k-50k Mortgage, Housing Insecurity', column.labels = c('Gini', '80/20', '80/5'),
          type = "text", omit = c("year","county"), out = "m3550.txt")

stargazer(m5075, title = '50k-75k Mortgage, Housing Insecurity', column.labels = c('Gini', '80/20', '80/5'),
          type = "text", omit = c("year","county"), out = "m5075.txt")


#-----------------
#Do more plotting 
#-----------------
#remove peurto rico
plot(mergedf.s.did$owner.percent, mergedf.s.did$Gini.estimate)
