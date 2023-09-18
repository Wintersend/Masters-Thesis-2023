dp21.c = subset(dp.2021[54:1124,])
#not everything plays nice, correct
dp21.c = as.numeric(dp21.c[,10:39])
dp21.c = as.data.frame(apply(dp21.c,2, as.numeric))

#showing unbound returns uninteresting results
#This can be used to test for 
hist(dp21.c$Estimate..HOUSEHOLDS.BY.TYPE..Total.households[dp21.c$Estimate..HOUSEHOLDS.BY.TYPE..Total.households < 500000], prob = TRUE)
lines(density(na.omit(dp21.c$Estimate..HOUSEHOLDS.BY.TYPE..Total.households[dp21.c$Estimate..HOUSEHOLDS.BY.TYPE..Total.households < 500000])))

#shows a few substantial breaks from the norm
hist(dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force, prob = TRUE)
lines(density(na.omit(dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force)))

#LA fucks with everything, kernal density is more useful
hist(dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force, prob = TRUE)
lines(density(na.omit(dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force)))


plot(density(na.omit(dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force[dp21.c$Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force < 500000])))

options(scipen=999)

mergedf = mergedf %>%
  transform(owner.percent = owner/(owner + renter),
            renter.percent = renter/(owner + renter))

plot(density(na.omit(mergedf$owner.percent[mergedf$year == 2010])), col = 1, main = "Ownership Density plot", ylab = "Density", xlab = "Percentage")
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2012])), col = 2)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2013])), col = 3)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2014])), col = 4)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2015])), col = 5)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2016])), col = 6)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2017])), col = 7)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2018])), col = 8)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2019])), col = 9)
lines(density(na.omit(mergedf$owner.percent[mergedf$year == 2021])), col = 10)

legend(x = "topright", legend = c('2010', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2021'),
       col = c(1,2,3,4,5,6,7,8,9,10),
       lwd = 2)

abline(v = 0.55)
abline(v = 0.7)


#check to see if renter is at all different
plot(density(na.omit(mergedf$renter.percent[mergedf$year == 2010])), col = 1, main = "Renter Density plot", ylab = "Density", xlab = "Percentage")
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2012])), col = 2)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2013])), col = 3)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2014])), col = 4)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2015])), col = 5)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2016])), col = 6)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2017])), col = 7)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2018])), col = 8)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2019])), col = 9)
lines(density(na.omit(mergedf$renter.percent[mergedf$year == 2021])), col = 10)

legend(x = "topright", legend = c('2010', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2021'),
       col = c(1,2,3,4,5,6,7,8,9,10),
       lwd = 2)


#calculate quartiles

attach(mergedf)


home_quant = as.data.frame(na.omit(cbind( year, owner.percent)))

owner.by.year = t(qpcR:::cbind.na(home_quant$owner.percent[home_quant$year == 2010],home_quant$owner.percent[home_quant$year == 2012],
                      home_quant$owner.percent[home_quant$year == 2013],home_quant$owner.percent[home_quant$year == 2014],
                      home_quant$owner.percent[home_quant$year == 2015],home_quant$owner.percent[home_quant$year == 2016],
                      home_quant$owner.percent[home_quant$year == 2017],home_quant$owner.percent[home_quant$year == 2018],
                      home_quant$owner.percent[home_quant$year == 2019],home_quant$owner.percent[home_quant$year == 2021]))


quant_graph(owner.by.year, 4, 'Home Ownership Percentile By Year')



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


home_quant = as.data.frame(na.omit(cbind( year, owner)))

owner.by.year = t(qpcR:::cbind.na(home_quant$owner[home_quant$year == 2010],home_quant$owner[home_quant$year == 2012],
                                  home_quant$owner[home_quant$year == 2013],home_quant$owner[home_quant$year == 2014],
                                  home_quant$owner[home_quant$year == 2015],home_quant$owner[home_quant$year == 2016],
                                  home_quant$owner[home_quant$year == 2017],home_quant$owner[home_quant$year == 2018],
                                  home_quant$owner[home_quant$year == 2019],home_quant$owner[home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')

#I'm just repeating this with random crap to see if anything jumps out at me
home_quant = as.data.frame(na.omit(cbind(year, renter.hh.size)))

owner.by.year = t(qpcR:::cbind.na(home_quant$renter.hh.size[home_quant$year == 2010],home_quant$renter.hh.size[home_quant$year == 2012],
                                  home_quant$renter.hh.size[home_quant$year == 2013],home_quant$renter.hh.size[home_quant$year == 2014],
                                  home_quant$renter.hh.size[home_quant$year == 2015],home_quant$renter.hh.size[home_quant$year == 2016],
                                  home_quant$renter.hh.size[home_quant$year == 2017],home_quant$renter.hh.size[home_quant$year == 2018],
                                  home_quant$renter.hh.size[home_quant$year == 2019],home_quant$renter.hh.size[home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')



home_quant = as.data.frame(na.omit(cbind(year, owner.hh.size)))

owner.by.year = t(qpcR:::cbind.na(home_quant$owner.hh.size[home_quant$year == 2010],home_quant$owner.hh.size[home_quant$year == 2012],
                                  home_quant$owner.hh.size[home_quant$year == 2013],home_quant$owner.hh.size[home_quant$year == 2014],
                                  home_quant$owner.hh.size[home_quant$year == 2015],home_quant$owner.hh.size[home_quant$year == 2016],
                                  home_quant$owner.hh.size[home_quant$year == 2017],home_quant$owner.hh.size[home_quant$year == 2018],
                                  home_quant$owner.hh.size[home_quant$year == 2019],home_quant$owner.hh.size[home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')

home_quant = as.data.frame(na.omit(cbind(year, inc.0.10)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')



home_quant = as.data.frame(na.omit(cbind(year, inc.10.15)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')


home_quant = as.data.frame(na.omit(cbind(year, inc.15.25)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')



home_quant = as.data.frame(na.omit(cbind(year, inc.25.35)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')



home_quant = as.data.frame(na.omit(cbind(year, inc.100.150)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')


home_quant = as.data.frame(na.omit(cbind(year, total.housing)))

owner.by.year = t(qpcR:::cbind.na(home_quant[,2][home_quant$year == 2010],home_quant[,2][home_quant$year == 2012],
                                  home_quant[,2][home_quant$year == 2013],home_quant[,2][home_quant$year == 2014],
                                  home_quant[,2][home_quant$year == 2015],home_quant[,2][home_quant$year == 2016],
                                  home_quant[,2][home_quant$year == 2017],home_quant[,2][home_quant$year == 2018],
                                  home_quant[,2][home_quant$year == 2019],home_quant[,2][home_quant$year == 2021]))


quant_graph(owner.by.year, 5, 'Home Ownership Percentile By Year')


linearmodel = lm(renter.percent ~ inc.10.15 + inc.100.150 + inc.15.25 + inc.150.200 + inc.200.abv + inc.25.35 + inc.35.50 + inc.50.75 + inc.75.100
  + owner.hh.size + year, data = mergedf)

mergedf$year = factor(mergedf$year)


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
         did.80.5 = log.income.gap.80.5 * south
         ) %>%
  ungroup
#My GINI isn't calculating properly inside mutate, use for loop instead
#-------------
n = nrow(mergedf.s.did)
#initialize empty column

for(i in 1:n){
  incs = c(5, 12.5, 20, 30, 42.5, 62.5, 87.5, 125, 175, 200)
  weightings = c(mergedf.s.did$inc.0.10[i], mergedf.s.did$inc.10.15[i], mergedf.s.did$inc.15.25[i], mergedf.s.did$inc.25.35[i],
                 mergedf.s.did$inc.35.50[i], mergedf.s.did$inc.50.75[i], mergedf.s.did$inc.75.100[i], mergedf.s.did$inc.100.150[i],
                 mergedf.s.did$inc.150.200[i], mergedf.s.did$inc.200.abv[i])
  mergedf.s.did$Gini.estimate.low[i] = Gini(incs, weightings)
}

#edit Gini to be multiplied by 100 for readability
mergedf.s.did = mergedf.s.did %>%
  group_by(state) %>%
  mutate(Gini.estimate.low = Gini.estimate.low*100,
         lagged.Gini.low = lag(Gini.estimate.low),
         lagged.Gini.sqr.low = lagged.Gini.low^2,
         Gini.estimate.sqr.low = Gini.estimate.low^2
  ) %>%
  ungroup

#Increased GINI (more realistic than using minimum)
for(i in 1:n){
  incs = c(5, 12.5, 20, 30, 42.5, 62.5, 87.5, 125, 175, 300)
  weightings = c(mergedf.s.did$inc.0.10[i], mergedf.s.did$inc.10.15[i], mergedf.s.did$inc.15.25[i], mergedf.s.did$inc.25.35[i],
                 mergedf.s.did$inc.35.50[i], mergedf.s.did$inc.50.75[i], mergedf.s.did$inc.75.100[i], mergedf.s.did$inc.100.150[i],
                 mergedf.s.did$inc.150.200[i], mergedf.s.did$inc.200.abv[i])
  mergedf.s.did$Gini.estimate.mid[i] = Gini(incs, weightings)
}


mergedf.s.did = mergedf.s.did %>%
  group_by(state) %>%
  mutate(Gini.estimate.mid = Gini.estimate.mid*100,
         lagged.Gini.mid = lag(Gini.estimate.mid),
         lagged.Gini.sqr.mid = lagged.Gini.mid^2,
         Gini.estimate.sqr.mid = Gini.estimate.mid^2
  ) %>%
  ungroup

#High GINI estimate
for(i in 1:n){
  incs = c(5, 12.5, 20, 30, 42.5, 62.5, 87.5, 125, 175, 500)
  weightings = c(mergedf.s.did$inc.0.10[i], mergedf.s.did$inc.10.15[i], mergedf.s.did$inc.15.25[i], mergedf.s.did$inc.25.35[i],
                 mergedf.s.did$inc.35.50[i], mergedf.s.did$inc.50.75[i], mergedf.s.did$inc.75.100[i], mergedf.s.did$inc.100.150[i],
                 mergedf.s.did$inc.150.200[i], mergedf.s.did$inc.200.abv[i])
  mergedf.s.did$Gini.estimate.high[i] = Gini(incs, weightings)
}

mergedf.s.did = mergedf.s.did %>%
  group_by(state) %>%
  mutate(Gini.estimate.high = Gini.estimate.high*100,
         lagged.Gini.high = lag(Gini.estimate.high),
         lagged.Gini.sqr.high = lagged.Gini.high^2,
         Gini.estimate.sqr.high = Gini.estimate.high^2
  ) %>%
  ungroup

#-------------------------
#run some regressions
#-------------------------
reg1 = lm(owner.percent ~ inc.0.10.dif + inc.10.15.dif + inc.15.25.dif + inc.25.35.dif + inc.35.50.dif + inc.50.75.dif + inc.75.100.dif 
          + inc.100.150.dif + inc.150.200.dif + inc.200.abv.dif
            , data = mergedf.s.did)

summary(reg1)

#fixed effects
reg2 = lm(owner.percent ~ inc.0.10.dif + inc.10.15.dif + inc.15.25.dif + inc.25.35.dif + inc.35.50.dif + inc.50.75.dif + inc.75.100.dif 
          + inc.100.150.dif + inc.150.200.dif + inc.200.abv.dif + county + year
          , data = mergedf.s.did)

summary(reg2)

#fixed effects against log ownership
reg3 = lm(log(owner) ~ inc.0.10.dif + inc.10.15.dif + inc.15.25.dif + inc.25.35.dif + inc.35.50.dif + inc.50.75.dif + inc.75.100.dif 
          + inc.100.150.dif + inc.150.200.dif + inc.200.abv.dif + county + year
          , data = mergedf.s.did)

summary(reg3)

#fixed effects and household size
reg4 = lm(owner.percent ~ inc.0.10.dif + inc.10.15.dif + inc.15.25.dif + inc.25.35.dif + inc.35.50.dif + inc.50.75.dif + inc.75.100.dif 
          + inc.100.150.dif + inc.150.200.dif + inc.200.abv.dif + owner.hh.size + renter.hh.size + county + year
          , data = mergedf.s.did)

summary(reg4)

#fixed effects against log ownership and household size
reg5 = lm(log(owner) ~ inc.0.10.dif + inc.10.15.dif + inc.15.25.dif + inc.25.35.dif + inc.35.50.dif + inc.50.75.dif + inc.75.100.dif 
          + inc.100.150.dif + inc.150.200.dif + inc.200.abv.dif + owner.hh.size + renter.hh.size + county + year
          , data = mergedf.s.did)

summary(reg5)

#use GINI instead of individual incomes
reg6 = lm(owner.percent ~ Gini.estimate + owner.hh.size + renter.hh.size + county + year
          , data = mergedf.s.did)

summary(reg6)


reg7 = lm(log(owner) ~ Gini.estimate + owner.hh.size + renter.hh.size + county + year
          , data = mergedf.s.did)

summary(reg7)

#gini with only year effects
reg8 = lm(owner.percent ~ Gini.estimate + year
          , data = mergedf.s.did)

summary(reg8)


reg9 = lm(log(owner) ~ Gini.estimate + year
          , data = mergedf.s.did)

summary(reg9)

#Gini with education differences
reg10 = lm(owner.percent ~ Gini.estimate + educ.9th.dif + educ.no.dip.dif + educ.dip.dif + educ.col.no.deg.dif
          + educ.associate.dif + educ.bachelor.dif + educ.graduate.deg.dif + year
          , data = mergedf.s.did)

summary(reg10)


reg11 = lm(log(owner) ~ Gini.estimate + educ.9th.dif + educ.no.dip.dif + educ.dip.dif + educ.col.no.deg.dif
          + educ.associate.dif + educ.bachelor.dif + educ.graduate.deg.dif + year
          , data = mergedf.s.did)

summary(reg11)

#Gini with total education
reg12 = lm(owner.percent ~ Gini.estimate + educ.9th + educ.no.dip + educ.dip + educ.col.no.deg
           + educ.associate + educ.bachelor + educ.graduate.deg + year
           , data = mergedf.s.did)

summary(reg12)


reg13 = lm(log(owner) ~ Gini.estimate + educ.9th + educ.no.dip + educ.dip + educ.col.no.deg
           + educ.associate + educ.bachelor + educ.graduate.deg + year
           , data = mergedf.s.did)

summary(reg13)

#Gini with log education
reg14 = lm(owner.percent ~ Gini.estimate + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.s.did)

summary(reg14)


reg15 = lm(log(owner) ~ Gini.estimate + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.s.did)

summary(reg15)

#Per point change in GINI

reg16 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.s.did)

summary(reg16)


reg17 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.s.did)

summary(reg17)


#include housing numbers

reg18 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.s.did)

summary(reg18)


reg19 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.s.did)

summary(reg19)

#owner difference shows minimal effect from anything but year and loses significant explainatory power
reg20 = lm(owner.dif ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.s.did)

summary(reg20)

#Include squared GINI
reg21 = lm(owner.dif ~ I(Gini.estimate*100) + I((Gini.estimate*100)^2) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.s.did)

summary(reg21)

reg22 = lm(owner.dif ~ Gini.estimate + I(Gini.estimate^2) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.s.did)

summary(reg22)



#Use Log Housing

reg23 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + year
           , data = mergedf.s.did)

summary(reg23)


reg24 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + year
           , data = mergedf.s.did)

summary(reg24)


#Gini, log education, log population, log housing

reg25 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + log(over.18.pop) + year
           , data = mergedf.s.did)

summary(reg25)


reg26 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + log(over.18.pop) + year
           , data = mergedf.s.did)

summary(reg26)

#FE Gini, log education, log population, log housing

reg27 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + log(over.18.pop) + year + as.factor(county)
           , data = mergedf.s.did)

summary(reg27)


reg28 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + log(total.housing) + log(over.18.pop) + year + as.factor(county)
           , data = mergedf.s.did)

summary(reg28)



reg29 = lm(owner.percent ~ I(Gini.estimate*100) + year + as.factor(county)
           , data = mergedf.s.did)

summary(reg29)

#------------------
#Check the above works at county level
#------------------

for(x in 1:28){
  mergedf[,5+x] = as.numeric(as.character(mergedf[,5+x]))
}

mergedf.dif = mergedf %>%
  group_by(county) %>%
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
         year = as.factor(year)
         #calculate gini, income values taking median of range, value in thousands, assume 200,000 is just 200
  ) %>%
  ungroup

n = nrow(mergedf.dif)
for(i in 1:n){
  incs = c(5, 12.5, 20, 30, 42.5, 62.5, 87.5, 125, 175, 200)
  weightings = c(mergedf.dif$inc.0.10[i], mergedf.dif$inc.10.15[i], mergedf.dif$inc.15.25[i], mergedf.dif$inc.25.35[i],
                 mergedf.dif$inc.35.50[i], mergedf.dif$inc.50.75[i], mergedf.dif$inc.75.100[i], mergedf.dif$inc.100.150[i],
                 mergedf.dif$inc.150.200[i], mergedf.dif$inc.200.abv[i])
  mergedf.dif$Gini.estimate[i] = Gini(incs, weightings)
}


#retest potentially useful values at a finer data level to try and test for spurious regression
#I need to reconstruct data frame to only include the needed data then NA.omit


mergedf.dif = mergedf.dif %>% drop_na(owner)
mergedf.dif = mergedf.dif %>% drop_na(Gini.estimate)
mergedf.dif = mergedf.dif %>% drop_na(inc.0.10)

reg16.2 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.dif)

summary(reg16.2)


reg17.2 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + year
           , data = mergedf.dif)

summary(reg17.2)


#include housing numbers

reg18.2 = lm(owner.percent ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.dif)

summary(reg18.2)


reg19.2 = lm(log(owner) ~ I(Gini.estimate*100) + log(educ.9th) + log(educ.no.dip) + log(educ.dip) + log(educ.col.no.deg)
           + log(educ.associate) + log(educ.bachelor) + log(educ.graduate.deg) + total.housing + year
           , data = mergedf.dif)

summary(reg19.2)

#-------------------------------------------------
#TESTING FOR NORMALITY
#-------------------------------------------------

#Plor residuals and test for normally distributed errors to see if estimated parameters are well defined
res.reg18 = residuals(reg18)


plot(res.reg18, ylab = 'Residuals', main = 'Gini, Log Edu, Housing Stock, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg18)



res.reg19 = residuals(reg19)


plot(res.reg19, ylab = 'Residuals', main = 'Gini, Log Edu, Housing Stock, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg19)



res.reg23 = residuals(reg23)


plot(res.reg23, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg23)

res.reg24 = residuals(reg24)


plot(res.reg24, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg24)

#latest update

res.reg25 = residuals(reg25)

plot(res.reg25, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Log Pop, Year',type = 'l')
abline(h=0)

#definitely still have heteroskedasticity
jarque.bera.test(res.reg25)

res.reg26 = residuals(reg26)


plot(res.reg26, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Log Pop, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg26)


#Fe Model

res.reg27 = residuals(reg27)

plot(res.reg27, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Log Pop, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg27)

res.reg28 = residuals(reg28)


plot(res.reg28, ylab = 'Residuals', main = 'Gini, Log Edu, Log Housing Stock, Log Pop, Year',type = 'l')
abline(h=0)


jarque.bera.test(res.reg28)
#Density plots to visual analyze how far from normal the distribution of the above 4 tests are.

#Initialize a normal overlay

plotNormalDensity(res.reg18)
plotNormalDensity(res.reg19)
plotNormalDensity(res.reg23)
plotNormalDensity(res.reg24)

#still decidedly not normal distribution and displays some bias, indicating missing variables
#But it is much better
plotNormalDensity(res.reg25)
plotNormalDensity(res.reg26)

plotNormalDensity(res.reg27)
plotNormalDensity(res.reg28)
#There is no normally distributed error terms may not be relevant

#It does look like there may be a heteroskedasticity problem



#---------------------------------
#Retest key regressions (18,19,23,24) with robust standard errors
#---------------------------------

reg18.robust = coeftest(reg18, vcovHC(reg18, type = 'HC0'))

reg19.robust = coeftest(reg19, vcovHC(reg19, type = 'HC0'))

reg23.robust = coeftest(reg23, vcovHC(reg23, type = 'HC0'))

reg24.robust = coeftest(reg24, vcovHC(reg24, type = 'HC0'))

reg25.robust = coeftest(reg25, vcovHC(reg25, type = 'HC0'))

reg26.robust = coeftest(reg26, vcovHC(reg26, type = 'HC0'))

reg27.robust = coeftest(reg27, vcovHC(reg27, type = 'HC0'))

reg28.robust = coeftest(reg28, vcovHC(reg28, type = 'HC0'))

#Compare robust and regular estimates
summary(reg18)
coeftest(reg18, vcovHC(reg18, type = 'HC0'))

summary(reg19)
coeftest(reg19, vcovHC(reg19, type = 'HC0'))

summary(reg23)
coeftest(reg23, vcovHC(reg23, type = 'HC0'))

summary(reg24)
coeftest(reg24, vcovHC(reg24, type = 'HC0'))


summary(reg25)
coeftest(reg25, vcovHC(reg25, type = 'HC0'))

summary(reg26)
coeftest(reg26, vcovHC(reg26, type = 'HC0'))


summary(reg27)
coeftest(reg27, vcovHC(reg27, type = 'HC0'))

summary(reg28)
coeftest(reg28, vcovHC(reg28, type = 'HC0'))

#------------------------------------
#Additional modified regressions utilizing relative metrics
#Owner Percentage Only
#------------------------------------

#remove Puerto Rico
analysis.set = mergedf.s.did[1:612,]

#remove DC
analysis.set = analysis.set[-(97:108),]
#---------
#low estimator regressions

base.reg.low = lm(owner.percent ~ Gini.estimate.low + housing.pop.working.age + year + county
              ,data = analysis.set)

summary(base.reg.low)

lag.reg.low = lm(owner.percent ~ lagged.Gini.low + housing.pop.working.age + year + county
             ,data = analysis.set)

summary(lag.reg.low)

gini.sqr.reg.low = lm(owner.percent ~ Gini.estimate.low + Gini.estimate.sqr.low + housing.pop.working.age + year + county
                ,data = analysis.set)

lag.sqr.reg.low = lm(owner.percent ~ lagged.Gini.low + lagged.Gini.sqr.low + housing.pop.working.age + year + county
               ,data = analysis.set)

AR.base.reg.low = lm(owner.percent ~ Gini.estimate.low + housing.pop.working.age + owner.percent.lag + year + county
                 ,data = analysis.set)

AR.lag.reg.low = lm(owner.percent ~ lagged.Gini.low + housing.pop.working.age + owner.percent.lag + year + county
         ,data = analysis.set)

summary(gini.sqr.reg.low)
summary(lag.sqr.reg.low)
summary(AR.base.reg.low)
summary(AR.lag.reg.low)


AR.base.reg2.low = lm(owner.percent ~ Gini.estimate.low + housing.pop.ratio + owner.percent.lag + year + county
                 ,data = analysis.set)

AR.lag.reg2.low = lm(owner.percent ~ lagged.Gini.low + housing.pop.ratio + owner.percent.lag + year + county
                ,data = analysis.set)


summary(AR.base.reg2.low)
summary(AR.lag.reg2.low)

AR.lag.reg3.low = lm(owner.percent ~ lagged.Gini.low + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                      ,data = analysis.set)

#medium estimator regressions

base.reg.mid = lm(owner.percent ~ Gini.estimate.mid + housing.pop.working.age + year + county
                  ,data = analysis.set)

summary(base.reg.mid)

lag.reg.mid = lm(owner.percent ~ lagged.Gini.mid + housing.pop.working.age + year + county
                 ,data = analysis.set)

summary(lag.reg.mid)

gini.sqr.reg.mid = lm(owner.percent ~ Gini.estimate.mid + Gini.estimate.sqr.mid + housing.pop.working.age + year + county
                      ,data = analysis.set)

lag.sqr.reg.mid = lm(owner.percent ~ lagged.Gini.mid + lagged.Gini.sqr.mid + housing.pop.working.age + year + county
                     ,data = analysis.set)

AR.base.reg.mid = lm(owner.percent ~ Gini.estimate.mid + housing.pop.working.age + owner.percent.lag + year + county
                     ,data = analysis.set)

AR.lag.reg.mid = lm(owner.percent ~ lagged.Gini.mid + housing.pop.working.age + owner.percent.lag + year + county
                    ,data = analysis.set)

summary(gini.sqr.reg.mid)
summary(lag.sqr.reg.mid)
summary(AR.base.reg.mid)
summary(AR.lag.reg.mid)


AR.base.reg2.mid = lm(owner.percent ~ Gini.estimate.mid + housing.pop.ratio + owner.percent.lag + year + county
                      ,data = analysis.set)

AR.lag.reg2.mid = lm(owner.percent ~ lagged.Gini.mid + housing.pop.ratio + owner.percent.lag + year + county
                     ,data = analysis.set)


summary(AR.base.reg2.mid)
summary(AR.lag.reg2.mid)

AR.lag.reg3.mid = lm(owner.percent ~ lagged.Gini.mid + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                      ,data = analysis.set)

#high estimator regressions

base.reg.high = lm(owner.percent ~ Gini.estimate.high + housing.pop.working.age + year + county
                  ,data = analysis.set)

summary(base.reg.high)

lag.reg.high = lm(owner.percent ~ lagged.Gini.high + housing.pop.working.age + year + county
                 ,data = analysis.set)

summary(lag.reg.high)

gini.sqr.reg.high = lm(owner.percent ~ Gini.estimate.high + Gini.estimate.sqr.high + housing.pop.working.age + year + county
                      ,data = analysis.set)

lag.sqr.reg.high = lm(owner.percent ~ lagged.Gini.high + lagged.Gini.sqr.high + housing.pop.working.age + year + county
                     ,data = analysis.set)

AR.base.reg.high = lm(owner.percent ~ Gini.estimate.high + housing.pop.working.age + owner.percent.lag + year + county
                     ,data = analysis.set)

AR.lag.reg.high = lm(owner.percent ~ lagged.Gini.high + housing.pop.working.age + owner.percent.lag + year + county
                    ,data = analysis.set)

summary(gini.sqr.reg.high)
summary(lag.sqr.reg.high)
summary(AR.base.reg.high)
summary(AR.lag.reg.high)


AR.base.reg2.high = lm(owner.percent ~ Gini.estimate.high + housing.pop.ratio + owner.percent.lag + year + county
                      ,data = analysis.set)

AR.lag.reg2.high = lm(owner.percent ~ lagged.Gini.high + housing.pop.ratio + owner.percent.lag + year + county
                     ,data = analysis.set)


summary(AR.base.reg2.high)
summary(AR.lag.reg2.high)


AR.lag.reg3.high = lm(owner.percent ~ lagged.Gini.high + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                      ,data = analysis.set)


summary(AR.lag.reg3.high)
plot(residuals(AR.lag.reg3.high), type = "l")
abline(h=0)
plot(density(residuals(AR.lag.reg3.high)))
plotNormalDensity(residuals(AR.lag.reg3.high))

plotNormalDensity(residuals(AR.lag.reg3.mid))
plotNormalDensity(residuals(AR.lag.reg3.low))
#-------------
#TRUE VALUES BECAUSE I FOUND THOSE
#-------------------
AR.lag.reg3 = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.reg3)

AR.lag.reg2 = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.reg2)

AR.lag.reg = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + year + county
                 ,data = analysis.set)

summary(AR.lag.reg)

working.pop.reg = lm(owner.percent ~ lagged.GINI + housing.pop.working.age + year + county
                ,data = analysis.set)

summary(working.pop.reg)

educ.reg = lm(owner.percent ~ lagged.GINI + housing.pop.working.age + educ.9th.share + educ.no.dip.share +
                educ.dip.share + educ.col.no.deg.share + educ.associate.share + educ.bachelor.share + educ.gradaute.share + year + county
              ,data = analysis.set)

summary(educ.reg)

#Use non-lagged gini
AR.reg3 = lm(owner.percent ~ GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.reg3)

AR.reg2 = lm(owner.percent ~ GINI + housing.pop.ratio + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.reg2)

Gini.reg = lm(owner.percent ~ GINI + housing.pop.ratio + year + county
                ,data = analysis.set)

summary(Gini.reg)

#Use basic 80-20 measure
AR.lag.8020 = lm(owner.percent ~ log.income.gap + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.8020)

AR.lag.8020.2 = lm(owner.percent ~ log.income.gap + housing.pop.ratio + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.8020.2)

AR.lag.8020.3 = lm(owner.percent ~ log.income.gap + housing.pop.ratio + year + county
                ,data = analysis.set)

summary(AR.lag.8020.3)

#Use 80-5 measure to test inequality at extremes
AR.lag.805 = lm(owner.percent ~ log.income.gap.80.5 + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = analysis.set)

summary(AR.lag.805)

AR.lag.805.2 = lm(owner.percent ~ log.income.gap.80.5 + housing.pop.ratio + owner.percent.lag + year + county
                   ,data = analysis.set)

summary(AR.lag.805.2)

AR.lag.805.3 = lm(owner.percent ~ log.income.gap.80.5 + housing.pop.ratio + year + county
                   ,data = analysis.set)

summary(AR.lag.805.3)


#DID between South and Non-South
AR.lag.reg3.south = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = subset(analysis.set, south == 1))

summary(AR.lag.reg3.south)
plot(resid(AR.lag.reg3.south))

AR.lag.reg3.north= lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                       ,data = subset(analysis.set, south == 0))

summary(AR.lag.reg3.north)



AR.lag.reg2.south = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.percent.lag + year + county
                 ,data = subset(analysis.set, south == 1))

summary(AR.lag.reg2.south)

AR.lag.reg2.north = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + owner.percent.lag + year + county
                       ,data = subset(analysis.set, south == 0))

summary(AR.lag.reg2.north)




AR.lag.reg.south = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + year + county
                ,data = subset(analysis.set, south == 1))

summary(AR.lag.reg.south)

AR.lag.reg.north = lm(owner.percent ~ lagged.GINI + housing.pop.ratio + year + county
                      ,data = subset(analysis.set, south == 0))

summary(AR.lag.reg.north)



working.pop.reg.south = lm(owner.percent ~ lagged.GINI + housing.pop.working.age + year + county
                     ,data = subset(analysis.set, south == 1))

summary(working.pop.reg.south)

working.pop.reg.north = lm(owner.percent ~ lagged.GINI + housing.pop.working.age + year + county
                           ,data = subset(analysis.set, south == 0))

summary(working.pop.reg.north)


educ.reg = lm(owner.percent ~ lagged.GINI + housing.pop.working.age + educ.9th.share + educ.no.dip.share +
                educ.dip.share + educ.col.no.deg.share + educ.associate.share + educ.bachelor.share + educ.gradaute.share + year + county
              ,data = analysis.set)

summary(educ.reg)


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
#-------------
#county level
#-----------------
mergedf.did = mergedf[order(mergedf.s$county),]
mergedf.did = mergedf
mergedf.did = mergedf[order(mergedf.did$county),]
for(x in 1:37){
  mergedf.did[,5+x] = as.numeric(as.character(mergedf.did[,5+x]))
}

#must use lag as dif is messing up somehow
mergedf.did = mergedf.did %>%
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
         south = if_else(county == 'Arizona' | county == 'New Mexico' | county == 'Texas'
                         | county == 'Oklahoma' | county == 'Arkansas' | county == 'Lousiana'
                         | county == 'Mississippi' | county == 'Alabama' | county == 'Georgia'
                         | county == 'Florida' | county == 'South Carolina' | county == 'Tehnnessee'
                         | county == 'North Carolina' | county == 'Kentucky',
                         1, 0),
         did.GINI = lagged.GINI * south,
         did.housing.pop.ratio = housing.pop.ratio * south,
         did.80.20 = log.income.gap * south,
         did.80.5 = log.income.gap.80.5 * south
  ) %>%
  ungroup





#alt DID spec
AR.lag.reg3.did.c = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio +did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                     ,data = mergedf.did)

summary(AR.lag.reg3.did.c)

AR.lag.reg2.did = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                     ,data = mergedf.did)

summary(AR.lag.reg2.did)

AR.lag.reg.did.c = lm(owner.percent ~ lagged.GINI +  did.GINI + housing.pop.ratio +did.housing.pop.ratio + year + county
                    ,data = mergedf.did)

summary(AR.lag.reg.did.c)

working.pop.reg = lm(owner.percent ~ lagged.GINI + did.GINI + housing.pop.ratio +did.housing.pop.ratio + year + county
                     ,data = mergedf.did)

summary(working.pop.reg)

#8020 alt
AR.lag.8020.c = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                 ,data = mergedf.did)

summary(AR.lag.8020.c)

AR.lag.8020.2 = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                   ,data = mergedf.did)

summary(AR.lag.8020.2)

AR.lag.8020.3.c = lm(owner.percent ~ log.income.gap + did.80.20 + housing.pop.ratio + did.housing.pop.ratio + year + county
                   ,data = mergedf.did)

summary(AR.lag.8020.3.c)


#805 alt
#Use 80-5 measure to test inequality at extremes
AR.lag.805 = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + owner.hh.size + renter.hh.size + owner.percent.lag + year + county
                ,data = mergedf.did)

summary(AR.lag.805)

AR.lag.805.2 = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + owner.percent.lag + year + county
                  ,data = mergedf.did)

summary(AR.lag.805.2)

AR.lag.805.3.c = lm(owner.percent ~ log.income.gap.80.5 + did.80.5 + housing.pop.ratio + did.housing.pop.ratio + year + county
                  ,data = mergedf.did)

summary(AR.lag.805.3.c)
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
       , ylim = c(0,0.25)
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

#---------------
#Publish Results
#---------------

#owner % regressions
models = list(AR.lag.reg,  AR.lag.reg2, AR.lag.reg3)

#owner regressions
models2 = list(reg19, reg24,  reg26, reg26.robust)

stargazer(models, title = 'Ownership % Regression Results', column.labels = c('GINI & Ratio only', 'AR term', "household size"),
                    type = "text", omit = c("year","county") , out = "prelimresults2.txt")

stargazer(models2, title = 'Number of Owners Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults2.txt")


stargazer(models, title = 'Ownership % Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults1.pdf")

stargazer(models2, title = 'Number of Owners Regression Results', column.labels = c('Absolute Housing', 'Log Housing', "Log Housing + Pop", 'Log Housing + pop RSE'),
          type = "text", out = "prelimresults2.txt")

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
