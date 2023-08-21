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

mergedf.s.did = mergedf.s[order(mergedf.s$state),]

for(x in 1:28){
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
         year = as.factor(year)
         #calculate gini, income values taking median of range, value in thousands, assume 200,000 is just 200
         ) %>%
  ungroup
#My GINI isn't calculating properly inside mutate, use for loop instead
n = nrow(mergedf.s.did)
#initialize empty column

for(i in 1:n){
  incs = c(5, 12.5, 20, 30, 42.5, 62.5, 87.5, 125, 175, 200)
  weightings = c(mergedf.s.did$inc.0.10[i], mergedf.s.did$inc.10.15[i], mergedf.s.did$inc.15.25[i], mergedf.s.did$inc.25.35[i],
                 mergedf.s.did$inc.35.50[i], mergedf.s.did$inc.50.75[i], mergedf.s.did$inc.75.100[i], mergedf.s.did$inc.100.150[i],
                 mergedf.s.did$inc.150.200[i], mergedf.s.did$inc.200.abv[i])
  mergedf.s.did$Gini.estimate[i] = Gini(incs, weightings)
}

#run some regressions
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




plot(mergedf.s.did$total.housing.dif, type = 'l', col = 'red')
abline(h = 0)

hist(mergedf.s.did$total.housing.dif, prob = TRUE)
lines(density(na.omit(mergedf.s.did$total.housing.dif)))