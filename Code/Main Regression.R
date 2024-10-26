

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
         civil.unemployment.rate.p.covid = civil.unemployment.rate * p.covid,
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
         
         #log inequality robustness
         log.20.20 = log(fifth.quant - first.quant),
         log.20.5 = log(top5 - first.quant),
         log.20.20.p.covid = log.20.20 * p.covid,
         log.20.5.p.covid = log.20.5 * p.covid
         ) %>%
  ungroup


#remove Puerto Rico
analysis.set = mergedf.s.did[1:612,]

#remove DC
analysis.set = analysis.set[-(97:108),]
analysis.set = analysis.set[order(analysis.set$year),]


#-------------------
#Regression on full data with all interaction terms
#------------------

#20.20 first
full.20.20.reg = lm(tmort.all.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + inc.20.20.int.20 + inc.20.20.int.20.35 +
     inc.20.20.int.35.50 + inc.20.20.int.50.75 + inc.20.20.int.75 + year + county
   ,data = analysis.set)


full.20.5.reg = lm(tmort.all.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + inc.20.5.int.20 + inc.20.5.int.20.35 +
                      inc.20.5.int.35.50 + inc.20.5.int.50.75 + inc.20.5.int.75 + year + county
                    ,data = analysis.set)

full.Gini.reg = lm(tmort.all.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + GINI.int.20 + GINI.int.20.35 +
                     GINI.int.35.50 + GINI.int.50.75 + GINI.int.75 + year + county
                    ,data = analysis.set)

#exclude high income 

ex.20.20.reg = lm(tmort.ex.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + inc.20.20.int.20 + inc.20.20.int.20.35 +
                      inc.20.20.int.35.50 + year + county
                    ,data = analysis.set)


ex.20.5.reg = lm(tmort.ex.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + inc.20.5.int.20 + inc.20.5.int.20.35 +
                     inc.20.5.int.35.50 + year + county
                   ,data = analysis.set)

ex.Gini.reg = lm(tmort.ex.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + GINI.int.20 + GINI.int.20.35 +
                     GINI.int.35.50 + year + county
                   ,data = analysis.set)


#By Income Range with no interaction
#Aggregate

full.20.20.reg.no.int = lm(tmort.all.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                    ,data = analysis.set)


full.20.5.reg.no.int = lm(tmort.all.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                   ,data = analysis.set)

full.Gini.reg.no.int = lm(tmort.all.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                   ,data = analysis.set)

#Exclude Top

ex.20.20.reg.no.int = lm(tmort.ex.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                             housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                           ,data = analysis.set)


ex.20.5.reg.no.int = lm(tmort.ex.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                            housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                          ,data = analysis.set)

ex.Gini.reg.no.int = lm(tmort.ex.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                            housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                          ,data = analysis.set)


#75,000+
t75.20.20.reg.no.int = lm(tmort.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                           housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                         ,data = analysis.set)


t75.20.5.reg.no.int = lm(tmort.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                          housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                        ,data = analysis.set)

t75.Gini.reg.no.int = lm(tmort.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                          housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                        ,data = analysis.set)
#50,000 - 75,000

t50.75.20.20.reg.no.int = lm(tmort.50.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                            housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                          ,data = analysis.set)


t50.75.20.5.reg.no.int = lm(tmort.50.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                           housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                         ,data = analysis.set)

t50.75.Gini.reg.no.int = lm(tmort.50.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                           housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                         ,data = analysis.set)

#35,000 - 50,000

t35.50.20.20.reg.no.int = lm(tmort.35.50.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                               housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                             ,data = analysis.set)


t35.50.20.5.reg.no.int = lm(tmort.35.50.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                              housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                            ,data = analysis.set)

t35.50.Gini.reg.no.int = lm(tmort.35.50.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                              housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                            ,data = analysis.set)
#20,000 - 35,000

t20.35.20.20.reg.no.int = lm(tmort.20.35.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                               housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                             ,data = analysis.set)


t20.35.20.5.reg.no.int = lm(tmort.20.35.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                              housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                            ,data = analysis.set)

t20.35.Gini.reg.no.int = lm(tmort.20.35.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                              housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                            ,data = analysis.set)

#Less than 20,000

t20.20.20.reg.no.int = lm(tmort.20.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                            housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                          ,data = analysis.set)


t20.20.5.reg.no.int = lm(tmort.20.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                           housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                         ,data = analysis.set)

t20.Gini.reg.no.int = lm(tmort.20.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                           housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                         ,data = analysis.set)

#homeownership

full.20.20.owner.reg = lm(owner.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
                      housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                    ,data = analysis.set)


full.20.5.owner.reg = lm(owner.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                   ,data = analysis.set)

full.Gini.owner.reg = lm(owner.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
                     housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county
                   ,data = analysis.set)

#make homeownership robust
full.20.20.owner.robust = coeftest(full.20.20.owner.reg, vcov = vcovHC(full.20.20.owner.reg, type = 'HC0'))
full.20.5.owner.robust = coeftest(full.20.5.owner.reg, vcov = vcovHC(full.20.5.owner.reg, type = 'HC0'))
full.Gini.owner.robust = coeftest(full.Gini.owner.reg, vcov = vcovHC(full.Gini.owner.reg, type = 'HC0'))

#make 20/20 robust
full.20.20.reg.no.int.robust = coeftest(full.20.20.reg.no.int, vcov = vcovHC(full.20.20.reg.no.int, type = 'HC0'))
ex.20.20.reg.no.int.robust = coeftest(ex.20.20.reg.no.int, vcov = vcovHC(ex.20.20.reg.no.int, type = 'HC0'))
t75.20.20.reg.no.int.robust = coeftest(t75.20.20.reg.no.int, vcov = vcovHC(t75.20.20.reg.no.int, type = 'HC0'))
t50.75.20.20.reg.no.int.robust = coeftest(t50.75.20.20.reg.no.int, vcov = vcovHC(t50.75.20.20.reg.no.int, type = 'HC0'))
t35.50.20.20.reg.no.int.robust = coeftest(t35.50.20.20.reg.no.int, vcov = vcovHC(t35.50.20.20.reg.no.int, type = 'HC0'))
t20.35.20.20.reg.no.int.robust = coeftest(t20.35.20.20.reg.no.int, vcov = vcovHC(t20.35.20.20.reg.no.int, type = 'HC0'))
t20.20.20.reg.no.int.robust = coeftest(t20.20.20.reg.no.int, vcov = vcovHC(t20.20.20.reg.no.int, type = 'HC0'))

#make 20/5 robust
full.20.5.reg.no.int.robust = coeftest(full.20.5.reg.no.int, vcov = vcovHC(full.20.5.reg.no.int, type = 'HC0'))
ex.20.5.reg.no.int.robust = coeftest(ex.20.5.reg.no.int, vcov = vcovHC(ex.20.5.reg.no.int, type = 'HC0'))
t75.20.5.reg.no.int.robust = coeftest(t75.20.5.reg.no.int, vcov = vcovHC(t75.20.5.reg.no.int, type = 'HC0'))
t50.75.20.5.reg.no.int.robust = coeftest(t50.75.20.5.reg.no.int, vcov = vcovHC(t50.75.20.5.reg.no.int, type = 'HC0'))
t35.50.20.5.reg.no.int.robust = coeftest(t35.50.20.5.reg.no.int, vcov = vcovHC(t35.50.20.5.reg.no.int, type = 'HC0'))
t20.35.20.5.reg.no.int.robust = coeftest(t20.35.20.5.reg.no.int, vcov = vcovHC(t20.35.20.5.reg.no.int, type = 'HC0'))
t20.20.5.reg.no.int.robust = coeftest(t20.20.5.reg.no.int, vcov = vcovHC(t20.20.5.reg.no.int, type = 'HC0'))

#make gini robust
full.Gini.reg.no.int.robust = coeftest(full.Gini.reg.no.int, vcov = vcovHC(full.Gini.reg.no.int, type = 'HC0'))
ex.Gini.reg.no.int.robust = coeftest(ex.Gini.reg.no.int, vcov = vcovHC(ex.Gini.reg.no.int, type = 'HC0'))
t75.Gini.reg.no.int.robust = coeftest(t75.Gini.reg.no.int, vcov = vcovHC(t75.Gini.reg.no.int, type = 'HC0'))
t50.75.Gini.reg.no.int.robust = coeftest(t50.75.Gini.reg.no.int, vcov = vcovHC(t50.75.Gini.reg.no.int, type = 'HC0'))
t35.50.Gini.reg.no.int.robust = coeftest(t35.50.Gini.reg.no.int, vcov = vcovHC(t35.50.Gini.reg.no.int, type = 'HC0'))
t20.35.Gini.reg.no.int.robust = coeftest(t20.35.Gini.reg.no.int, vcov = vcovHC(t20.35.Gini.reg.no.int, type = 'HC0'))
t20.Gini.reg.no.int.robust = coeftest(t20.Gini.reg.no.int, vcov = vcovHC(t20.Gini.reg.no.int, type = 'HC0'))

#---------------------
#SUR model
#--------------------
#create flags for each of my regressions

#start with 20/20

#omit 20,000 as the number is very close to 1
r1.20.20 = tmort.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r2.20.20 = tmort.50.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r3.20.20 = tmort.35.50.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r4.20.20 = tmort.20.35.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

fitsur.20.20 = systemfit(list(tmort.75 = r1.20.20, tmort.50.75 = r2.20.20, tmort.35.50 = r3.20.20, tmort.20.35 = r4.20.20), data = analysis.set)
summary(fitsur.20.20)

#test restriction that the effect of income ratio varies
#I need to run restrictions independently
#wait no, look up how to use this
#ok or maybe I can't test that they are all equal
restriction.20.20 = c("tmort.75_income.ratio.20.20 = tmort.50.75_income.ratio.20.20", 
'tmort.50.75_income.ratio.20.20 = tmort.35.50_income.ratio.20.20', 'tmort.35.50_income.ratio.20.20 = tmort.20.35_income.ratio.20.20')

linearHypothesis(fitsur.20.20, restriction.20.20, test = 'Chisq')


#do tests on effect of pre+post covid
linearHypothesis(fitsur.20.20, 'tmort.75_income.ratio.20.20 + tmort.75_income.ratio.20.20.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.20, 'tmort.50.75_income.ratio.20.20 + tmort.50.75_income.ratio.20.20.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.20, 'tmort.20.35_income.ratio.20.20 + tmort.20.35_income.ratio.20.20.p.covid = 0', test = 'Chisq')


#20/5
r1.20.5 = tmort.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r2.20.5 = tmort.50.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r3.20.5 = tmort.35.50.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r4.20.5 = tmort.20.35.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

fitsur.20.5 = systemfit(list(tmort.75 = r1.20.5, tmort.50.75 = r2.20.5, tmort.35.50 = r3.20.5, tmort.20.35 = r4.20.5), data = analysis.set)
summary(fitsur.20.5)

#Restriction Test 20/5

restriction.20.5 = c("tmort.75_income.ratio.20.5 = tmort.50.75_income.ratio.20.5",
'tmort.50.75_income.ratio.20.5 = tmort.35.50_income.ratio.20.5', 'tmort.35.50_income.ratio.20.5 = tmort.20.35_income.ratio.20.5')
linearHypothesis(fitsur.20.5, restriction.20.5, test = 'Chisq')


#do tests on effect of pre+post covid
linearHypothesis(fitsur.20.5, 'tmort.75_income.ratio.20.5 + tmort.75_income.ratio.20.5.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.5, 'tmort.50.75_income.ratio.20.5 + tmort.50.75_income.ratio.20.5.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.5, 'tmort.20.35_income.ratio.20.5 + tmort.20.35_income.ratio.20.5.p.covid = 0', test = 'Chisq')

#Gini

r1.Gini = tmort.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r2.Gini = tmort.50.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r3.Gini = tmort.35.50.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r4.Gini = tmort.20.35.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

fitsur.Gini = systemfit(list(tmort.75 = r1.Gini, tmort.50.75 = r2.Gini, tmort.35.50 = r3.Gini, tmort.20.35 = r4.Gini), data = analysis.set)
summary(fitsur.Gini)

#Restriction Test Gini

restriction.Gini = c("tmort.75_GINI = tmort.50.75_GINI", 'tmort.50.75_GINI = tmort.35.50_GINI', "tmort.35.50_GINI = tmort.20.35_GINI")
linearHypothesis(fitsur.Gini, restriction.Gini, test = 'Chisq')

#do tests on effect of pre+post covid
linearHypothesis(fitsur.Gini, 'tmort.75_GINI + tmort.75_GINI.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.Gini, 'tmort.50.75_GINI + tmort.50.75_GINI.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.Gini, 'tmort.20.35_GINI + tmort.20.35_GINI.p.covid = 0', test = 'Chisq')

#------------------
#County Robustness Check (WILL NEED TO REMAKE COUNTY DATASET WITH ONLY THOSE THAT APPEAR IN ALL PERIODS)
#------------------
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

kernal.plotter(analysis.set$tmort.20.30.percent, analysis.set, "20k Annual Income or Less Housing Instability", "Coefficient", 'Density')
mean(analysis.set$nmort.20.30.percent[analysis.set$year == 2022]) - mean(analysis.set$nmort.20.30.percent[analysis.set$year == 2010])

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


#---------------
#Publish Results
#---------------
stargazer(fitsur.20.20)
#full breakdown by type
t20.20 = list(t75.20.20.reg.no.int, t50.75.20.20.reg.no.int, t35.50.20.20.reg.no.int, t20.35.20.20.reg.no.int)
stargazer(t20.20, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                        '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Income Ratio', '20/20 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/SUR.20.20.txt')


t20.5 = list(t75.20.5.reg.no.int, t50.75.20.5.reg.no.int, t35.50.20.5.reg.no.int, t20.35.20.5.reg.no.int)
stargazer(t20.5, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                       '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Income Ratio', '20/5 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/SUR.20.5.txt')


tGini = list(t75.Gini.reg.no.int, t50.75.Gini.reg.no.int, t35.50.Gini.reg.no.int, t20.35.Gini.reg.no.int)
stargazer(tGini, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel C: Gini, Housing Stress Robust',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                       '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('Gini*100', 'Gini*100 Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid') 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size',
                               ,out = 'Results/SUR.GINI.txt')

#Export Robust
t20.20.robust = list(t75.20.20.reg.no.int.robust, t50.75.20.20.reg.no.int.robust, t35.50.20.20.reg.no.int.robust, t20.35.20.20.reg.no.int.robust)
stargazer(t20.20.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Income Ratio', '20/20 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/SUR.20.20.robust.txt')


t20.5.robust = list(t75.20.5.reg.no.int.robust, t50.75.20.5.reg.no.int.robust, t35.50.20.5.reg.no.int.robust, t20.35.20.5.reg.no.int.robust)
stargazer(t20.5.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Income Ratio', '20/5 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/SUR.20.5.robust.txt')


tGini.robust = list(t75.Gini.reg.no.int.robust, t50.75.Gini.reg.no.int.robust, t35.50.Gini.reg.no.int.robust, t20.35.Gini.reg.no.int.robust)
stargazer(tGini.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel C: Gini, Housing Stress Robust',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('Gini*100', 'Gini*100 Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid') 
          #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size',
          ,out = 'Results/SUR.GINI.robust.txt')

#can i trivially export
#write.xlsx(t20.20, 'SUR.20.20.xlsx')

#export SUR covariance
sur.20.20.cor = cov2cor(fitsur.20.20$residCov)

write.xlsx(round(sur.20.20.cor,4), 'Results/sur.20.20.cor.xlsx')

sur.20.5.cor = cov2cor(fitsur.20.5$residCov)

write.xlsx(round(sur.20.5.cor,4), 'Results/sur.20.5.cor.xlsx')

sur.Gini.cor = cov2cor(fitsur.Gini$residCov)

write.xlsx(round(sur.Gini.cor,4), 'Results/sur.Gini.cor.xlsx')

#Owner.Percent export
owners = list(full.20.20.owner.robust, full.20.5.owner.robust, full.Gini.owner.robust)

stargazer(owners, dep.var.caption = 'Dependent Variable is Percentage of the Population Who Are Homeowners', title = 'Ownership Robustness Check',
          type = 'text', omit = c('year','county', 'owner.hh.size', 'renter.hh.size'), dep.var.labels = c(''), column.labels = c('20/20 Income Ratio', '20/5 Income Ratio', 'Gini Coefficient'),
          covariate.labels = c('20/20 Income Ratio', '20/20 Income Ratio Covid','20/5 Income Ratio', '20/5 Income Ratio Covid','Gini*100', 
                               'Gini*100 Covid', 'Housing to Population Ratio'),
          out = 'Results/Homeownership.robustnesscheck.txt')




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

region.plotter('tmort.all.30.percent', 0, 50, "Overall Housing Stress by Region", "Over 30% rate")
region.plotter('tmort.75.30.percent', 0, 20, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.50.75.30.percent', 0, 50, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.35.50.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.20.35.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.20.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('tmort.ex.30.percent', 40, 75, "Overall Housing Stress by Region, Excluding Households With Income Over 50k", "Over 30% rate")

region.plotter('mort.all.30.percent', 20, 50, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.50.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.35.50.30.percent', 0.4, 0.9, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.20.35.30.percent', 0.75, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.20.30.percent', 0.95, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('mort.20.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")

region.plotter('nmort.all.30.percent', 0, 100, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.50.75.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.35.50.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.20.35.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")
region.plotter('nmort.20.30.percent', 0, 1, "Overall Housing Insecurity by Region", "Over 30% rate")

region.plotter('first.quant', 5000, 25000, "First Quintile Income by Region", "Income")
abline(h=20000)
region.plotter('second.quant', 20000, 70000, "Second Quintile Income by Region", "Income")
region.plotter('third.quant', 40000, 120000, "Third Quintile Income by Region", "Income")
region.plotter('fourth.quant', 60000, 170000, "Fourth Quintile Income by Region", "Income")
region.plotter('fifth.quant', 140000, 400000, "Fifth Quintile Income by Region", "Income")
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
write.xlsx(as.data.frame(round(panel.a.20.20[,2:3], 4)), "Results/panel.a.20.20.xlsx")
write.xlsx(as.data.frame(round(panel.b.20.20[,2:3], 4)), "Results/panel.b.20.20.xlsx")
write.xlsx(as.data.frame(round(panel.c.20.20[,2:3], 4)), "Results/panel.c.20.20.xlsx")
write.xlsx(as.data.frame(round(panel.d.20.20[,2:3], 4)), "Results/panel.d.20.20.xlsx")

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
write.xlsx(as.data.frame(round(panel.a.20.5[,2:3], 4)), "Results/panel.a.20.5.xlsx")
write.xlsx(as.data.frame(round(panel.b.20.5[,2:3], 4)), "Results/panel.b.20.5.xlsx")
write.xlsx(as.data.frame(round(panel.c.20.5[,2:3], 4)), "Results/panel.c.20.5.xlsx")
write.xlsx(as.data.frame(round(panel.d.20.5[,2:3], 4)), "Results/panel.d.20.5.xlsx")

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
write.xlsx(as.data.frame(round(panel.a.GINI[,2:3], 4)), "Results/panel.a.GINI.xlsx")
write.xlsx(as.data.frame(round(panel.b.GINI[,2:3], 4)), "Results/panel.b.GINI.xlsx")
write.xlsx(as.data.frame(round(panel.c.GINI[,2:3], 4)), "Results/panel.c.GINI.xlsx")
write.xlsx(as.data.frame(round(panel.d.GINI[,2:3], 4)), "Results/panel.d.GINI.xlsx")

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
write.xlsx(as.data.frame(round(panel.a.tmort.30[,2:3], 4)), "Results/panel.a.tmort.30.xlsx")
write.xlsx(as.data.frame(round(panel.b.tmort.30[,2:3], 4)), "Results/panel.b.tmort.30.xlsx")
write.xlsx(as.data.frame(round(panel.c.tmort.30[,2:3], 4)), "Results/panel.c.tmort.30.xlsx")
write.xlsx(as.data.frame(round(panel.d.tmort.30[,2:3], 4)), "Results/panel.d.tmort.30.xlsx")

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
write.xlsx(as.data.frame(round(panel.a.tmort.ex.30[,2:3], 4)), "Results/panel.a.tmort.ex.30.xlsx")
write.xlsx(as.data.frame(round(panel.b.tmort.ex.30[,2:3], 4)), "Results/panel.b.tmort.ex.30.xlsx")
write.xlsx(as.data.frame(round(panel.c.tmort.ex.30[,2:3], 4)), "Results/panel.c.tmort.ex.30.xlsx")
write.xlsx(as.data.frame(round(panel.d.tmort.ex.30[,2:3], 4)), "Results/panel.d.tmort.ex.30.xlsx")



#---------------------------------
#COUNTY ROBUSTNESS CHECK
#--------------------------------
mergedf.c = mergedc.y[order(mergedc.y$county),]

for(x in 1:58){
  mergedf.c[,5+x] = as.numeric(as.character(mergedf.c[,5+x]))
}

#must use lag as dif is messing up somehow
mergedf.c = mergedf.c %>%
  group_by(county) %>%
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
    civil.unemployment.rate.p.covid = civil.unemployment.rate * p.covid,
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


#-----------
#Lin check
#---------
#create flags for each of my regressions

#start with 20/20

#omit 20,000 as the number is very close to 1
r1.20.20c = lm(tmort.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r2.20.20c = lm(tmort.50.75.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r3.20.20c = lm(tmort.35.50.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r4.20.20c = lm(tmort.20.35.30.percent ~ income.ratio.20.20 + income.ratio.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)





#20/5
r1.20.5c = lm(tmort.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r2.20.5c = lm(tmort.50.75.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r3.20.5c = lm(tmort.35.50.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r4.20.5c = lm(tmort.20.35.30.percent ~ income.ratio.20.5 + income.ratio.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)




#Gini

r1.Ginic = lm(tmort.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r2.Ginic = lm(tmort.50.75.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r3.Ginic = lm(tmort.35.50.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

r4.Ginic = lm(tmort.20.35.30.percent ~ GINI + GINI.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = mergedf.c)

#--------------
#Export
#------------------


t20.20c = list(r1.20.20c, r2.20.20c, r3.20.20c, r4.20.20c)
stargazer(t20.20c, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress County',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Income Ratio', '20/20 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/C.20.20.txt')

t20.5c = list(r1.20.5c, r2.20.5c, r3.20.5c, r4.20.5c)
stargazer(t20.5c, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress County',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Income Ratio', '20/5 Income Ratio Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/C.20.5.txt')

tGinic = list(r1.Ginic, r2.Ginic, r3.Ginic, r4.Ginic)
stargazer(tGinic, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel C: Gini, Housing Stress County',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('Gini*100', 'Gini*100 Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid') 
          #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size',
          ,out = 'Results/C.GINI.txt'
)

#-----
#check nas
#-------
sum(is.na(mergedf.c$civil.unemployment.rate))
sum(is.na(mergedf.c$owner.hh.size))
sum(is.na(mergedf.c$renter.hh.size))
sum(is.na(mergedf.c$housing.pop.working.age))
sum(is.na(mergedf.c$tmort.35.50.30.percent))
sum(is.na(mergedf.c$GINI))
sum(is.na(mergedf.c$income.ratio.20.20))
