

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

for(x in 1:58){
mergedf.s.did[,5+x] = as.numeric(as.character(mergedf.s.did[,5+x]))
}

#must use lag as dif is messing up somehow
mergedf.s.did = mergedf.s.did %>%
  group_by(state) %>%
  mutate(#ownership metrics
         owner.percent = owner/(owner + renter) * 100,
         renter.percent = renter/(owner + renter) * 100,
         year = as.factor(year),
         over.18.pop.dif = over.18.pop - lag(over.18.pop),
         civil.unemployment.rate = (unemployed.pop.labor/total.pop.labor) * 100,
         #Education metrics
         educated.pop =  educ.9th + educ.no.dip + educ.dip + educ.col.no.deg + educ.associate + educ.bachelor + educ.graduate.deg   ,
         educ.9th.share = educ.9th/educated.pop,
         educ.no.dip.share = educ.no.dip/educated.pop,
         educ.dip.share = educ.dip/educated.pop,
         educ.col.no.deg.share = educ.col.no.deg/educated.pop,
         educ.associate.share = educ.associate/educated.pop,
         educ.bachelor.share = educ.bachelor/educated.pop,
         educ.gradaute.share = educ.graduate.deg/educated.pop,
         housing.pop.ratio = (total.housing/over.18.pop) * 100,
         #working age calcs
         working.age = over.18.pop - over.65.pop,
         housing.pop.working.age = (total.housing/working.age) * 100,
         #housing.pop.total = total.housing/population
         #calculate gini, income values taking median of range, value in thousands, assume 200,000 is just 200
         GINI = GINI*100,
         income.ratio.20.20 = fifth.quant/first.quant,
         income.ratio.20.5 = top5/first.quant,
         #mortgage ratio calculations
         mort.20.30.percent = (mort.20.30/mort.20) * 100,
         mort.20.35.30.percent = (mort.20.35.30/mort.20.35) * 100,
         mort.35.50.30.percent = (mort.35.50.30/mort.35.50) * 100,
         mort.50.75.30.percent = (mort.50.75.30/mort.50.75) * 100,
         mort.75.30.percent = (mort.75.30/mort.75) * 100,
         mort.all = mort.20 + mort.20.35 + mort.35.50 + mort.50.75 + mort.75,
         mort.all.30 = mort.20.30 + mort.20.35.30 + mort.35.50.30 + mort.50.75.30 + mort.75.30,
         mort.all.30.percent = (mort.all.30/mort.all) * 100,
         #no mortgage but owner ratio calculations
         nmort.20.30.percent = (nmort.20.30/nmort.20) * 100,
         nmort.20.35.30.percent = (nmort.20.35.30/nmort.20.35) * 100,
         nmort.35.50.30.percent = (nmort.35.50.30/nmort.35.50) * 100,
         nmort.50.75.30.percent = (nmort.50.75.30/nmort.50.75) * 100,
         nmort.75.30.percent = (nmort.75.30/nmort.75) * 100,
         nmort.all = nmort.20 + nmort.20.35 + nmort.35.50 + nmort.50.75 + nmort.75,
         nmort.all.30 = nmort.20.30 + nmort.20.35.30 + nmort.35.50.30 + nmort.50.75.30 + nmort.75.30,
         nmort.all.30.percent = (nmort.all.30/nmort.all) * 100,
         #all owner calculations
         tmort.20.30.percent = ((mort.20.30 + nmort.20.30)/(mort.20 + nmort.20)) * 100,
         tmort.20.35.30.percent = ((mort.20.35.30 + nmort.20.35.30)/(mort.20.35 + nmort.20.35)) * 100,
         tmort.35.50.30.percent = ((mort.35.50.30 + nmort.35.50.30)/(mort.35.50 + nmort.35.50)) * 100,
         tmort.50.75.30.percent = ((mort.50.75.30 + nmort.50.75.30)/(mort.50.75 + nmort.50.75)) * 100,
         tmort.75.30.percent = ((mort.75.30 + nmort.75.30)/(mort.75 + nmort.75)) * 100,
         tmort.all = mort.20 + mort.20.35 + mort.35.50 + mort.50.75 + mort.75 + nmort.20 + nmort.20.35 + nmort.35.50 + nmort.50.75 + nmort.75,
         tmort.all.30 = mort.20.30 + mort.20.35.30 + mort.35.50.30 + mort.50.75.30 + mort.75.30 + nmort.20.30 + nmort.20.35.30 + nmort.35.50.30 + nmort.50.75.30 + nmort.75.30,
         tmort.all.30.percent = (tmort.all.30/tmort.all) * 100,
         #omit above 50k income
         tmort.ex = mort.20 + mort.20.35 + mort.35.50 + nmort.20 + nmort.20.35 + nmort.35.50,
         tmort.ex.30 = mort.20.30 + mort.20.35.30 + mort.35.50.30 + nmort.20.30 + nmort.20.35.30 + nmort.35.50.30,
         tmort.ex.30.percent = (tmort.ex.30/tmort.ex) * 100,
         #Region
         south = if_else(county == 'Arizona' | county == 'New Mexico' | county == 'Texas'
                         | county == 'Oklahoma' | county == 'Arkansas' | county == 'Louisiana'
                         | county == 'Mississippi' | county == 'Alabama' | county == 'Georgia'
                         | county == 'Florida' | county == 'South Carolina' | county == 'Tennessee'
                         | county == 'North Carolina' | county == 'Kentucky',
                         1, 0),
         #post Covid interaction
         p.covid = if_else(year == 2022 | year == 2021, 1, 0),
         GINI.p.covid = GINI * p.covid,
         income.ratio.20.20.p.covid = income.ratio.20.20 * p.covid,
         income.ratio.20.5.p.covid = income.ratio.20.5 * p.covid,
         #Mortgage Share interaction setup
         #percent of owners that fall in a certain range maybe? I guess?
         tmort.20.share = ((mort.20 + nmort.20)/tmort.all) * 100,
         tmort.20.35.share = ((mort.20.35 + nmort.20.35)/tmort.all) * 100,
         tmort.35.50.share = ((mort.35.50 + nmort.35.50)/tmort.all) * 100,
         tmort.50.75.share = ((mort.50.75 + nmort.50.75)/tmort.all) * 100,
         tmort.75.share = ((mort.75 + nmort.75)/tmort.all) * 100,
         
         #interaction terms
         inc.20.20.int.20 = income.ratio.20.20 * tmort.20.share,
         inc.20.20.int.20.35 = income.ratio.20.20 * tmort.20.35.share,
         inc.20.20.int.35.50 = income.ratio.20.20 * tmort.35.50.share,
         inc.20.20.int.50.75 = income.ratio.20.20 * tmort.50.75.share,
         inc.20.20.int.75 = income.ratio.20.20 * tmort.75.share,
         
         inc.20.5.int.20 = income.ratio.20.5 * tmort.20.share,
         inc.20.5.int.20.35 = income.ratio.20.5 * tmort.20.35.share,
         inc.20.5.int.35.50 = income.ratio.20.5 * tmort.35.50.share,
         inc.20.5.int.50.75 = income.ratio.20.5 * tmort.50.75.share,
         inc.20.5.int.75 = income.ratio.20.5 * tmort.75.share,
         
         GINI.int.20 = GINI * tmort.20.share,
         GINI.int.20.35 = GINI * tmort.20.35.share,
         GINI.int.35.50 = GINI * tmort.35.50.share,
         GINI.int.50.75 = GINI * tmort.50.75.share,
         GINI.int.75 = GINI * tmort.75.share,
         ) %>%
  ungroup


#remove Puerto Rico
analysis.set = mergedf.s.did[1:612,]

#remove DC
analysis.set = analysis.set[-(97:108),]
analysis.set = analysis.set[order(analysis.set$year),]

#---------------
#STATE LEVEL Housing Share 
#REDO WITH ADJUSTED VARIABLES
#---------------
#20.000

m20.gini = lm(tmort.20.30.percent ~ GINI + housing.pop.ratio + owner.hh.size + renter.hh.size  + year + county
                     ,data = analysis.set)

summary(m20.gini)

m20.8020 = lm(tmort.20.30.percent ~ log.income.gap +  housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m20.8020)

m20.805 = lm(tmort.20.30.percent ~ log.income.gap.80.5 +  housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m20.805)

#robust
m.20.stability.gini.robust = coeftest(m20.gini, vcov = vcovHC(m20.gini, type = 'HC0'))

m.20.stability.8020.robust = coeftest(m20.8020, vcov = vcovHC(m20.8020, type = 'HC0'))

m.20.stability.805.robust = coeftest(m20.805, vcov = vcovHC(m20.805, type = 'HC0'))

#20.000-35.000
m20.35.gini = lm(tmort.20.35.30.percent ~ GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
              ,data = analysis.set)

summary(m20.35.gini)

m20.35.8020 = lm(tmort.20.35.30.percent ~ log.income.gap + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
              ,data = analysis.set)

summary(m20.35.8020)

m20.35.805 = lm(tmort.20.35.30.percent ~ log.income.gap.80.5 + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
             ,data = analysis.set)

summary(m20.35.805)

#robust
m.20.35.stability.gini.robust = coeftest(m20.35.gini, vcov = vcovHC(m20.35.gini, type = 'HC0'))

m.20.35.stability.8020.robust = coeftest(m20.35.8020, vcov = vcovHC(m20.35.8020, type = 'HC0'))

m.20.35.stability.805.robust = coeftest(m20.35.805, vcov = vcovHC(m20.35.805, type = 'HC0'))


#35.000-50.000
m35.50.gini = lm(tmort.35.50.30.percent ~ GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.gini)

m35.50.8020 = lm(tmort.35.50.30.percent ~ log.income.gap + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m35.50.8020)

m35.50.805 = lm(tmort.35.50.30.percent ~ log.income.gap.80.5 + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m35.50.805)

#robust
m.35.50.stability.gini.robust = coeftest(m35.50.gini, vcov = vcovHC(m35.50.gini, type = 'HC0'))

m.35.50.stability.8020.robust = coeftest(m35.50.8020, vcov = vcovHC(m35.50.8020, type = 'HC0'))

m.35.50.stability.805.robust = coeftest(m35.50.805, vcov = vcovHC(m35.50.805, type = 'HC0'))

#50.000-75.000

m50.75.gini = lm(tmort.50.75.30.percent ~ GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m50.75.gini)

m50.75.8020 = lm(tmort.50.75.30.percent ~ log.income.gap + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                 ,data = analysis.set)

summary(m50.75.8020)

m50.75.805 = lm(tmort.50.75.30.percent ~ log.income.gap.80.5 + housing.pop.ratio + owner.hh.size + renter.hh.size + year + county
                ,data = analysis.set)

summary(m50.75.805)

#robust
m.50.75.stability.gini.robust = coeftest(m50.75.gini, vcov = vcovHC(m50.75.gini, type = 'HC0'))

m.50.75.stability.8020.robust = coeftest(m50.75.8020, vcov = vcovHC(m50.75.8020, type = 'HC0'))

m.50.75.stability.805.robust = coeftest(m50.75.805, vcov = vcovHC(m50.75.805, type = 'HC0'))



#-------------------
#Regression on full data with all interaction terms
#------------------

#20.20 first
full.20.20.reg = lm(tmort.all.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
     housing.pop.working.age + civil.unemployment.rate + inc.20.20.int.20 + inc.20.20.int.20.35 +
     inc.20.20.int.35.50 + inc.20.20.int.50.75 + inc.20.20.int.75 + year + county
   ,data = analysis.set)


full.20.5.reg = lm(tmort.all.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + inc.20.5.int.20 + inc.20.5.int.20.35 +
                      inc.20.5.int.35.50 + inc.20.5.int.50.75 + inc.20.5.int.75 + year + county
                    ,data = analysis.set)

full.Gini.reg = lm(tmort.all.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + GINI.int.20 + GINI.int.20.35 +
                     GINI.int.35.50 + GINI.int.50.75 + GINI.int.75 + year + county
                    ,data = analysis.set)

#exclude high income 

ex.20.20.reg = lm(tmort.ex.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + inc.20.20.int.20 + inc.20.20.int.20.35 +
                      inc.20.20.int.35.50 + year + county
                    ,data = analysis.set)


ex.20.5.reg = lm(tmort.ex.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + inc.20.5.int.20 + inc.20.5.int.20.35 +
                     inc.20.5.int.35.50 + year + county
                   ,data = analysis.set)

ex.Gini.reg = lm(tmort.ex.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + GINI.int.20 + GINI.int.20.35 +
                     GINI.int.35.50 + year + county
                   ,data = analysis.set)
#homeownership

full.20.20.owner.reg = lm(owner.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + inc.20.20.int.20 + inc.20.20.int.20.35 +
                      inc.20.20.int.35.50 + inc.20.20.int.50.75 + inc.20.20.int.75 + year + county
                    ,data = analysis.set)


full.20.5.owner.reg = lm(owner.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + inc.20.5.int.20 + inc.20.5.int.20.35 +
                     inc.20.5.int.35.50 + inc.20.5.int.50.75 + inc.20.5.int.75 + year + county
                   ,data = analysis.set)

full.Gini.owner.reg = lm(owner.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + GINI.int.20 + GINI.int.20.35 +
                     GINI.int.35.50 + GINI.int.50.75 + GINI.int.75 + year + county
                   ,data = analysis.set)
#------------------
#Some more visual analysis
#---------------


#kernal plotter function
kernal.plotter = function(x, y, mains, xlabs, ylabs = 'Density'){

  plot(density(na.omit(x[y$year == 2010])), col = 1, main = mains, ylab = ylabs, xlab = xlabs
       ,ylim = c(0,4)
       #,xlim = c(150000,600000)
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

kernal.plotter(analysis.set$log.income.gap, analysis.set, "Log Income 20:20 Gap", "Coefficient", 'Density')
mean(analysis.set$log.income.gap[analysis.set$year == 2022]) - mean(analysis.set$log.income.gap[analysis.set$year == 2010])
#ln(1+dif) = % change

kernal.plotter(analysis.set$log.income.gap.80.5, analysis.set, "Log Income 20:5 Gap", "Coefficient", 'Density')
mean(analysis.set$log.income.gap.80.5[analysis.set$year == 2022]) - mean(analysis.set$log.income.gap.80.5[analysis.set$year == 2010])

kernal.plotter(analysis.set$tmort.20.30.percent, analysis.set, "20k Annual Income or Less Housing Instability", "Coefficient", 'Density')
mean(analysis.set$mort.20.30.percent[analysis.set$year == 2022]) - mean(analysis.set$mort.20.30.percent[analysis.set$year == 2010])

kernal.plotter(analysis.set$tmort.20.35.30.percent, analysis.set, "20k-35k Annual Income Housing Instability", "Coefficient", 'Density')
mean(analysis.set$mort.20.35.30.percent[analysis.set$year == 2022]) - mean(analysis.set$mort.20.35.30.percent[analysis.set$year == 2010])

kernal.plotter(analysis.set$tmort.35.50.30.percent, analysis.set, "35k-50k Annual Income Housing Instability", "Coefficient", 'Density')
mean(analysis.set$mort.35.50.30.percent[analysis.set$year == 2022]) - mean(analysis.set$mort.35.50.30.percent[analysis.set$year == 2010])

kernal.plotter(analysis.set$tmort.50.75.30.percent, analysis.set, "50k-75k Annual Income Housing Instability", "Coefficient", 'Density')
mean(analysis.set$mort.50.75.30.percent[analysis.set$year == 2022]) - mean(analysis.set$mort.50.75.30.percent[analysis.set$year == 2010])

kernal.plotter(analysis.set$housing.pop.working.age, analysis.set, "Housing by working age", "Percentage")

kernal.plotter(analysis.set$housing.pop.ratio, analysis.set, "Housing by population", "Percentage")

kernal.plotter(analysis.set$owner.percent, analysis.set, "Owner Percentage", "Percentage")

kernal.plotter(analysis.set$first.quant, analysis.set, "Bottom Income Quintile", "Income in USD")

kernal.plotter(analysis.set$fifth.quant, analysis.set, "Top Income Quintile", "Income in USD")

kernal.plotter(analysis.set$top5, analysis.set, "Top 5% Income", "Income in USD")


kernal.plotter

lig.mean = mean(analysis.set$log.income.gap)
lig.sd = sd(analysis.set$log.income.gap)
analysis.set$county[analysis.set$log.income.gap > lig.mean+2*lig.sd]


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

model8020 = list(AR.lag.8020, AR.lag.8020.2, AR.lag.8020.3)

stargazer(model8020, title = "Ownership % by 80/20 Income Inequality", column.labels = c('DID Only', 'AR Term', 'Household Size'),
          type = "text", omit = c("year","county") , out = "8020percent.txt")

model805 = list(AR.lag.805, AR.lag.805.2, AR.lag.805.3)

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


#ROBUST
#GINI housing
housing.gini.r = list(ownership.Gini.robust, ownership.Gini.robust.2, ownership.Gini.robust.3)
stargazer(housing.gini.r, title = 'Ownership % by GINI Robust', column.labels = c('DID only', 'AR Term', "Household Size"),
          type = "text", omit = c("year","county") , out = "ginipercentrobust.txt")

#8020 housing
housing.8020.r = list(ownership.8020.robust, ownership.8020.robust.2, ownership.8020.robust.3)
stargazer(housing.8020.r, title = "Ownership % by 80/20 Income Inequality Robust", column.labels = c('DID Only', 'AR Term', 'Household Size'),
          type = "text", omit = c("year","county") , out = "8020percentrobust.txt")


#805 housing
housing.805.r = list(ownership.805.robust, ownership.805.robust.2, ownership.805.robust.3)
stargazer(housing.805.r, title = "Ownership % by 80/5 Income Inequality Robust", column.labels = c('DID Only', 'AR Term', 'Household Size'),
          type = "text", omit = c("year","county") , out = "805percentrobust.txt")

#mask all non key variables for presentation

#sub 20 stability
m20.r = list(m.20.stability.gini.robust, m.20.stability.8020.robust, m.20.stability.805.robust)

stargazer(m20.r,dep.var.caption = 'Dependent Variable is 30% Or More Of Income To Housing', title = 'Panel A: Under 20k Annual Income, Housing Insecurity Robust',
          type = "text", omit = c("year","county", 'housing.pop.ratio', 'owner.hh.size', 'renter.hh.size'),
          covariate.labels = c('Gini coefficient * 100', 'Log 20:20 Income Gap', 'Log 20:5 Income Gap' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
                               )
          ,out = "m20robust.txt")

#20-35 stability
m20.35.r = list(m.20.35.stability.gini.robust, m.20.35.stability.8020.robust, m.20.35.stability.805.robust)
stargazer(m20.35.r,dep.var.caption = 'Dependent Variable is 30% Or More Of Income To Housing', title = 'Panel B: 20k-35k Annual Income, Housing Insecurity Robust',
          type = "text", omit = c("year","county", 'housing.pop.ratio', 'owner.hh.size', 'renter.hh.size'),
          covariate.labels = c('Gini coefficient * 100', 'Log 20:20 Income Gap', 'Log 20:5 Income Gap'
                               #, 'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
                               )
          , out = "m2035robust.txt")

#35-50 stability
m35.50.r = list(m.35.50.stability.gini.robust, m.35.50.stability.8020.robust, m.35.50.stability.805.robust)

stargazer(m35.50.r,dep.var.caption = 'Dependent Variable is 30% Or More Of Income To Housing', title = 'Panel C: 35k-50k Annual Income, Housing Insecurity Robust',
          type = "text", omit = c("year","county", 'housing.pop.ratio', 'owner.hh.size', 'renter.hh.size'),
          covariate.labels = c('Gini coefficient * 100', 'Log 20:20 Income Gap', 'Log 20:5 Income Gap'
                               #, 'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
                               )
          , out = "m3550robust.txt")

#50-75 stability
m50.75.r = list(m.50.75.stability.gini.robust, m.50.75.stability.8020.robust, m.50.75.stability.805.robust)
stargazer(m50.75.r,dep.var.caption = 'Dependent Variable is 30% Or More Of Income To Housing', title = 'Panel D: 50k-75k Annual Income, Housing Insecurity Robust',
          type = "text", omit = c("year","county", 'housing.pop.ratio', 'owner.hh.size', 'renter.hh.size'),
          covariate.labels = c('Gini coefficient * 100', 'Log 20:20 Income Gap', 'Log 20:5 Income Gap'
                               #, 'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
                               )
          , out = "m5075robust.txt")


#-----------------
#more descriptive statistics 
#-----------------
#compare relative growth of income
mean(na.omit(analysis.set$first.quant[analysis.set$year == 2010]))
mean(na.omit(analysis.set$first.quant[analysis.set$year == 2022]))

mean(na.omit(analysis.set$first.quant[analysis.set$year == 2022]))/mean(na.omit(analysis.set$first.quant[analysis.set$year == 2010]))

mean(na.omit(analysis.set$top5[analysis.set$year == 2010]))
mean(na.omit(analysis.set$top5[analysis.set$year == 2022]))

mean(na.omit(analysis.set$top5[analysis.set$year == 2022]))/mean(na.omit(analysis.set$top5[analysis.set$year == 2010]))

for(i in 2010:2022){
  first.quant.mean[i-2009] = mean(analysis.set$first.quant[analysis.set$year==i])
  fifth.quant.mean[i-2009] = mean(analysis.set$fifth.quant[analysis.set$year==i])
  top5.mean[i-2009] = mean(analysis.set$top5[analysis.set$year==i])
  }



plot(first.quant.mean, type = 'l', ylim = c(10000, 600000))
lines(fifth.quant.mean, type = 'l', col = 2)
lines(top5.mean, type = 'l', col = 3)


#By Region plotting function

region.plotter = function(x, yliml, ylimm, mains, ylabs){
plot.default(analysis.set %>%
         group_by(year) %>%
         filter(region == 1) %>%
         summarise_at(vars(x), list(name = mean)), type = 'b', ylim = c(yliml,ylimm),
         main = mains, ylab = ylabs)

lines(analysis.set %>%
        group_by(year) %>%
        filter(region == 2) %>%
        summarise_at(vars(x), list(name = mean)), type = 'b', col = 2)

lines(analysis.set %>%
        group_by(year) %>%
        filter(region == 3) %>%
        summarise_at(vars(x), list(name = mean)), type = 'b', col = 3)

lines(analysis.set %>%
        group_by(year) %>%
        filter(region == 4) %>%
        summarise_at(vars(x), list(name = mean)), type = 'b', col = 4)

legend(x = "topleft", legend = c('Northeast', 'Midwest', 'South', 'West'),
       col = c(1,2,3,4),
       lwd = 2)
}

region.plotter('income.ratio.20.20', 12, 18, "20.20 Income Ratio by Region", "Income Ratio")
region.plotter('income.ratio.20.5', 18, 30, "20.5 Income Ratio by Region", "Income Ratio")
region.plotter('GINI', 40, 65, "GINI by Region", "GINI Coef * 100")

region.plotter('tmort.all.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.50.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.35.50.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.20.35.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.20.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")

region.plotter('mort.all.30.percent', 0.2, 0.5, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.50.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.35.50.30.percent', 0.4, 0.9, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.20.35.30.percent', 0.75, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.20.30.percent', 0.95, 1, "Overall Housing Insecurity by Region", "Over 30% rate")

region.plotter('nmort.all.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.50.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.35.50.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.20.35.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.20.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")


#keep this on hand for nested things in case I need multiple filter example again
panel.a.20.20 = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(income.ratio.20.20), list(mean = mean, sd = sd))


#is it reasonable for me to do this 4 times as summary stats?
#I think it is
#not sure its reasonable to function it

#export 20/20

panel.a.20.20 = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(income.ratio.20.20), list(Mean = mean, SD = sd))

panel.b.20.20 = analysis.set %>%
  group_by(year) %>%
  filter(region == 2) %>%
  summarise_at(vars(income.ratio.20.20), list(Mean = mean, SD = sd))

panel.c.20.20 = analysis.set %>%
  group_by(year) %>%
  filter(region == 3) %>%
  summarise_at(vars(income.ratio.20.20), list(Mean = mean, SD = sd))

panel.d.20.20 = analysis.set %>%
  group_by(year) %>%
  filter(region == 4) %>%
  summarise_at(vars(income.ratio.20.20), list(Mean = mean, SD = sd))

#this is annoying and slow and needs to be done manually but I've already spent half an hour on this
write.xlsx(as.data.frame(round(panel.a.20.20[,2:3], 4)), "panel.a.20.20.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.b.20.20[,2:3], 4)), "panel.b.20.20.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.c.20.20[,2:3], 4)), "panel.c.20.20.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.d.20.20[,2:3], 4)), "panel.d.20.20.xlsx", asTable = FALSE)

#export 20/5
panel.a.20.5 = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(income.ratio.20.5), list(Mean = mean, SD = sd))

panel.b.20.5 = analysis.set %>%
  group_by(year) %>%
  filter(region == 2) %>%
  summarise_at(vars(income.ratio.20.5), list(Mean = mean, SD = sd))

panel.c.20.5 = analysis.set %>%
  group_by(year) %>%
  filter(region == 3) %>%
  summarise_at(vars(income.ratio.20.5), list(Mean = mean, SD = sd))

panel.d.20.5 = analysis.set %>%
  group_by(year) %>%
  filter(region == 4) %>%
  summarise_at(vars(income.ratio.20.5), list(Mean = mean, SD = sd))

#this is annoying and slow and needs to be done manually but I've already spent half an hour on this
write.xlsx(as.data.frame(round(panel.a.20.5[,2:3], 4)), "panel.a.20.5.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.b.20.5[,2:3], 4)), "panel.b.20.5.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.c.20.5[,2:3], 4)), "panel.c.20.5.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.d.20.5[,2:3], 4)), "panel.d.20.5.xlsx", asTable = FALSE)

#export Gini
panel.a.GINI = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(GINI), list(Mean = mean, SD = sd))

panel.b.GINI = analysis.set %>%
  group_by(year) %>%
  filter(region == 2) %>%
  summarise_at(vars(GINI), list(Mean = mean, SD = sd))

panel.c.GINI = analysis.set %>%
  group_by(year) %>%
  filter(region == 3) %>%
  summarise_at(vars(GINI), list(Mean = mean, SD = sd))

panel.d.GINI = analysis.set %>%
  group_by(year) %>%
  filter(region == 4) %>%
  summarise_at(vars(GINI), list(Mean = mean, SD = sd))

#this is annoying and slow and needs to be done manually but I've already spent half an hour on this
write.xlsx(as.data.frame(round(panel.a.GINI[,2:3], 4)), "panel.a.GINI.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.b.GINI[,2:3], 4)), "panel.b.GINI.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.c.GINI[,2:3], 4)), "panel.c.GINI.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.d.GINI[,2:3], 4)), "panel.d.GINI.xlsx", asTable = FALSE)

#export housing insecurity
panel.a.tmort.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(tmort.all.30.percent), list(Mean = mean, SD = sd))

panel.b.tmort.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 2) %>%
  summarise_at(vars(tmort.all.30.percent), list(Mean = mean, SD = sd))

panel.c.tmort.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 3) %>%
  summarise_at(vars(tmort.all.30.percent), list(Mean = mean, SD = sd))

panel.d.tmort.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 4) %>%
  summarise_at(vars(tmort.all.30.percent), list(Mean = mean, SD = sd))

#this is annoying and slow and needs to be done manually but I've already spent half an hour on this
write.xlsx(as.data.frame(round(panel.a.tmort.30[,2:3], 4)), "panel.a.tmort.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.b.tmort.30[,2:3], 4)), "panel.b.tmort.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.c.tmort.30[,2:3], 4)), "panel.c.tmort.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.d.tmort.30[,2:3], 4)), "panel.d.tmort.30.xlsx", asTable = FALSE)

#export housing insecurity except for over 50k
panel.a.tmort.ex.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 1) %>%
  summarise_at(vars(tmort.ex.30.percent), list(Mean = mean, SD = sd))

panel.b.tmort.ex.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 2) %>%
  summarise_at(vars(tmort.ex.30.percent), list(Mean = mean, SD = sd))

panel.c.tmort.ex.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 3) %>%
  summarise_at(vars(tmort.ex.30.percent), list(Mean = mean, SD = sd))

panel.d.tmort.ex.30 = analysis.set %>%
  group_by(year) %>%
  filter(region == 4) %>%
  summarise_at(vars(tmort.ex.30.percent), list(Mean = mean, SD = sd))

#this is annoying and slow and needs to be done manually but I've already spent half an hour on this
write.xlsx(as.data.frame(round(panel.a.tmort.ex.30[,2:3], 4)), "panel.a.tmort.ex.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.b.tmort.ex.30[,2:3], 4)), "panel.b.tmort.ex.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.c.tmort.ex.30[,2:3], 4)), "panel.c.tmort.ex.30.xlsx", asTable = FALSE)
write.xlsx(as.data.frame(round(panel.d.tmort.ex.30[,2:3], 4)), "panel.d.tmort.ex.30.xlsx", asTable = FALSE)
