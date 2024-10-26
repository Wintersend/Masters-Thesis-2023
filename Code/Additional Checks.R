#analysis set no covid
no.cov = analysis.set[order(analysis.set$year),]
no.cov = no.cov[1:500,]

#-------------
#SUR without post covid
#cannot do, near singular
#--------------
#note this all rename the original so must rerun

r1.20.20 = tmort.75.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

r2.20.20 = tmort.50.75.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

r3.20.20 = tmort.35.50.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

r4.20.20 = tmort.20.35.30.percent ~ income.ratio.20.20 + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

#model is close to singular
#comment out
#fitsur.20.20 = systemfit(list(tmort.75 = r1.20.20, tmort.50.75 = r2.20.20, tmort.35.50 = r3.20.20, tmort.20.35 = r4.20.20), data = no.cov)
#summary(fitsur.20.20)

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
r1.20.5 = tmort.75.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

r2.20.5 = tmort.50.75.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

r3.20.5 = tmort.35.50.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county

r4.20.5 = tmort.20.35.30.percent ~ income.ratio.20.5 + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

#model is close to singular
#comment out
#fitsur.20.5 = systemfit(list(tmort.75 = r1.20.5, tmort.50.75 = r2.20.5, tmort.35.50 = r3.20.5, tmort.20.35 = r4.20.5), data = no.cov)
#summary(fitsur.20.5)

#Restriction Test 20/5

restriction.20.5 = c("tmort.75_income.ratio.20.5 = tmort.50.75_income.ratio.20.5",
                     'tmort.50.75_income.ratio.20.5 = tmort.35.50_income.ratio.20.5', 'tmort.35.50_income.ratio.20.5 = tmort.20.35_income.ratio.20.5')
linearHypothesis(fitsur.20.5, restriction.20.5, test = 'Chisq')


#do tests on effect of pre+post covid
linearHypothesis(fitsur.20.5, 'tmort.75_income.ratio.20.5 + tmort.75_income.ratio.20.5.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.5, 'tmort.50.75_income.ratio.20.5 + tmort.50.75_income.ratio.20.5.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.20.5, 'tmort.20.35_income.ratio.20.5 + tmort.20.35_income.ratio.20.5.p.covid = 0', test = 'Chisq')

#Gini

r1.Gini = tmort.75.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

r2.Gini = tmort.50.75.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

r3.Gini = tmort.35.50.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

r4.Gini = tmort.20.35.30.percent ~ GINI  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county

#model is close to singular
#comment out
#fitsur.Gini = systemfit(list(tmort.75 = r1.Gini, tmort.50.75 = r2.Gini, tmort.35.50 = r3.Gini, tmort.20.35 = r4.Gini), data = no.cov)
#summary(fitsur.Gini)

#Restriction Test Gini

restriction.Gini = c("tmort.75_GINI = tmort.50.75_GINI", 'tmort.50.75_GINI = tmort.35.50_GINI', "tmort.35.50_GINI = tmort.20.35_GINI")
linearHypothesis(fitsur.Gini, restriction.Gini, test = 'Chisq')

#do tests on effect of pre+post covid
linearHypothesis(fitsur.Gini, 'tmort.75_GINI + tmort.75_GINI.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.Gini, 'tmort.50.75_GINI + tmort.50.75_GINI.p.covid = 0', test = 'Chisq')
linearHypothesis(fitsur.Gini, 'tmort.20.35_GINI + tmort.20.35_GINI.p.covid = 0', test = 'Chisq')

#-----------------
#Regular model
#-----------------



r1.20.20.n = lm(tmort.75.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)

r2.20.20.n = lm(tmort.50.75.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)


r3.20.20.n = lm(tmort.35.50.30.percent ~ income.ratio.20.20  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)


r4.20.20.n = lm(tmort.20.35.30.percent ~ income.ratio.20.20 + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)



r1.20.5.n = lm(tmort.75.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)

r2.20.5.n = lm(tmort.50.75.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)

r3.20.5.n = lm(tmort.35.50.30.percent ~ income.ratio.20.5  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate  + year + county, data = no.cov)

r4.20.5.n = lm(tmort.20.35.30.percent ~ income.ratio.20.5 + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)


r1.Gini.n = lm(tmort.75.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)

r2.Gini.n = lm(tmort.50.75.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)

r3.Gini.n = lm(tmort.35.50.30.percent ~ GINI + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)

r4.Gini.n = lm(tmort.20.35.30.percent ~ GINI  + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + year + county, data = no.cov)

#Get robust standard errors for above
#20/20
no.cov.r1.20.20.robust = coeftest(r1.20.20.n, vcov = vcovHC(r1.20.20.n, type = 'HC0'))
no.cov.r2.20.20.robust = coeftest(r2.20.20.n, vcov = vcovHC(r2.20.20.n, type = 'HC0'))
no.cov.r3.20.20.robust = coeftest(r3.20.20.n, vcov = vcovHC(r3.20.20.n, type = 'HC0'))
no.cov.r4.20.20.robust = coeftest(r4.20.20.n, vcov = vcovHC(r4.20.20.n, type = 'HC0'))

#20/5
no.cov.r1.20.5.robust = coeftest(r1.20.5.n, vcov = vcovHC(r1.20.5.n, type = 'HC0'))
no.cov.r2.20.5.robust = coeftest(r2.20.5.n, vcov = vcovHC(r2.20.5.n, type = 'HC0'))
no.cov.r3.20.5.robust = coeftest(r3.20.5.n, vcov = vcovHC(r3.20.5.n, type = 'HC0'))
no.cov.r4.20.5.robust = coeftest(r4.20.5.n, vcov = vcovHC(r4.20.5.n, type = 'HC0'))

#gini
no.cov.r1.Gini.robust = coeftest(r1.Gini.n, vcov = vcovHC(r1.Gini.n, type = 'HC0'))
no.cov.r2.Gini.robust = coeftest(r2.Gini.n, vcov = vcovHC(r2.Gini.n, type = 'HC0'))
no.cov.r3.Gini.robust = coeftest(r3.Gini.n, vcov = vcovHC(r3.Gini.n, type = 'HC0'))
no.cov.r4.Gini.robust = coeftest(r4.Gini.n, vcov = vcovHC(r4.Gini.n, type = 'HC0'))

#export above

#20/20
no.cov.20.20.robust = list(no.cov.r1.20.20.robust, no.cov.r2.20.20.robust, no.cov.r3.20.20.robust, no.cov.r4.20.20.robust)

stargazer(no.cov.20.20.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust, No Covid',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Income Ratio', 'Housing to Population Ratio', 'Unemployment Rate' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/no.cov.20.20.robust.txt')

#20/5
no.cov.20.5.robust = list(no.cov.r1.20.5.robust, no.cov.r2.20.5.robust, no.cov.r3.20.5.robust, no.cov.r4.20.5.robust)


stargazer(no.cov.20.5.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust, No Covid',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Income Ratio', 'Housing to Population Ratio', 'Unemployment Rate' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/no.cov.20.5.robust.txt')

#gini
tGini.robust = list(no.cov.r1.Gini.robust, no.cov.r2.Gini.robust, no.cov.r3.Gini.robust, no.cov.r4.Gini.robust)


stargazer(tGini.robust, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel C: Gini, Housing Stress Robust, No Covid',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('Gini*100', 'Housing to Population Ratio', 'Unemployment Rate') 
          #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size',
          ,out = 'Results/no.cov.GINI.robust.txt'
)

#20/20
no.cov.20.20 = list(r1.20.20.n, r2.20.20.n, r3.20.20.n, r4.20.20.n)

stargazer(no.cov.20.20, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust, No Covid',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Income Ratio', 'Housing to Population Ratio', 'Unemployment Rate' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/no.cov.20.20.txt')

#20/5
no.cov.20.5 = list(r1.20.5.n, r2.20.5.n, r3.20.5.n, r4.20.5.n)


stargazer(no.cov.20.5, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust, No Covid',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Income Ratio', 'Housing to Population Ratio', 'Unemployment Rate' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/no.cov.20.5.txt')

#gini
tGini = list(r1.Gini.n, r2.Gini.n, r3.Gini.n, r4.Gini.n)


stargazer(tGini, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel C: Gini, Housing Stress Robust, No Covid',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('Gini*100', 'Housing to Population Ratio', 'Unemployment Rate') 
          #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size',
          ,out = 'Results/no.cov.GINI.txt'
)

#--------------------------------
#Log Inequality Robustness Check
#--------------------------------

#omit 20,000 as the number is very close to 1
r1.log.20.20 = tmort.75.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r2.log.20.20 = tmort.50.75.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r3.log.20.20 = tmort.35.50.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r4.log.20.20 = tmort.20.35.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

fitsur.log.20.20 = systemfit(list(tmort.75 = r1.log.20.20, tmort.50.75 = r2.log.20.20, tmort.35.50 = r3.log.20.20, tmort.20.35 = r4.log.20.20), data = analysis.set)
summary(fitsur.log.20.20)


#20/5
r1.log.20.5 = tmort.75.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r2.log.20.5 = tmort.50.75.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r3.log.20.5 = tmort.35.50.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

r4.log.20.5 = tmort.20.35.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county

fitsur.log.20.5 = systemfit(list(tmort.75 = r1.log.20.5, tmort.50.75 = r2.log.20.5, tmort.35.50 = r3.log.20.5, tmort.20.35 = r4.log.20.5), data = analysis.set)
summary(fitsur.log.20.5)

#do the exportable regressions
#20/20
r1.log.20.20 = lm(tmort.75.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r2.log.20.20 = lm(tmort.50.75.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r3.log.20.20 = lm(tmort.35.50.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r4.log.20.20 = lm(tmort.20.35.30.percent ~ log.20.20 + log.20.20.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

#20/5
r1.log.20.5 = lm(tmort.75.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r2.log.20.5 = lm(tmort.50.75.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r3.log.20.5 = lm(tmort.35.50.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

r4.log.20.5 = lm(tmort.20.35.30.percent ~ log.20.5 + log.20.5.p.covid + owner.hh.size + renter.hh.size +
  housing.pop.working.age + civil.unemployment.rate + civil.unemployment.rate.p.covid + year + county, data = analysis.set)

#make robust
#20/20
log.r1.20.20.robust = coeftest(r1.log.20.20, vcov = vcovHC(r1.log.20.20, type = 'HC0'))
log.r2.20.20.robust = coeftest(r2.log.20.20, vcov = vcovHC(r2.log.20.20, type = 'HC0'))
log.r3.20.20.robust = coeftest(r3.log.20.20, vcov = vcovHC(r3.log.20.20, type = 'HC0'))
log.r4.20.20.robust = coeftest(r4.log.20.20, vcov = vcovHC(r4.log.20.20, type = 'HC0'))

#20/5
log.r1.20.5.robust = coeftest(r1.log.20.5, vcov = vcovHC(r1.log.20.5, type = 'HC0'))
log.r2.20.5.robust = coeftest(r2.log.20.5, vcov = vcovHC(r2.log.20.5, type = 'HC0'))
log.r3.20.5.robust = coeftest(r3.log.20.5, vcov = vcovHC(r3.log.20.5, type = 'HC0'))
log.r4.20.5.robust = coeftest(r4.log.20.5, vcov = vcovHC(r4.log.20.5, type = 'HC0'))


#20/20
log.20.20 = list(log.r1.20.20.robust, log.r2.20.20.robust, log.r3.20.20.robust, log.r4.20.20.robust)

stargazer(log.20.20, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust, Log Gap',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Log Income Gap','20/20 Log Income Gap Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid'
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/log.20.20.robust.txt')

#20/5
log.20.5 = list(log.r1.20.5.robust, log.r2.20.5.robust, log.r3.20.5.robust, log.r4.20.5.robust)


stargazer(log.20.5, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust, Log Gap',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Log Income Gap','20/5 Log Income Gap Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/log.20.5.robust.txt')


#non-robust
#20/20
log.20.20 = list(r1.log.20.20, r2.log.20.20, r3.log.20.20, r4.log.20.20)

stargazer(log.20.20, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel A: 20/20 Income Ratio, Housing Stress Robust, Log Gap',
          type = "text", dep.var.labels = c('','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'), column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                          '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/20 Log Income Gap','20/20 Log Income Gap Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid'
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/log.20.20.txt')

#20/5
log.20.5 = list(r1.log.20.5, r2.log.20.5, r3.log.20.5, r4.log.20.5)


stargazer(log.20.5, dep.var.caption = 'Dependent Variable is Housing Stress', title = 'Panel B: 20/5 Income Ratio, Housing Stress Robust, Log Gap',
          type = "text",dep.var.labels = c('','','','','','',''), omit = c("year","county", 'owner.hh.size', 'renter.hh.size'),column.labels = c('Over 75,000', '50,000 - 74,999', 
                                                                                                                                                 '35,000 - 49,999', '20,000 - 34,999'),
          covariate.labels = c('20/5 Log Income Gap','20/5 Log Income Gap Covid', 'Housing to Population Ratio', 'Unemployment Rate', 'Unemployment Rate Covid' 
                               #,'Housing to Population Ratio * 100', 'Average Owner Household Size', 'Average Renter Household Size'
          ),out = 'Results/log.20.5.txt')