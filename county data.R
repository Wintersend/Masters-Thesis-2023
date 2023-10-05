#load in social, economic, housing, demographic, and mortgage characteristics for each year
#data is ostensibly subdivision level but is really county level

#Each year has different counties, making this panel data
#Need to figure out how to work with that effectively

house.2010.c = read.csv("ACS Data/2010/Housing.csv", skip = 1)
inc.2010.c = read.csv("ACS Data/2010/Quant.csv", skip = 1)
dp2.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP02-Data.csv", skip = 1)
dp3.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP03-Data.csv", skip = 1)
dp4.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP04-Data.csv", skip = 1)
dp5.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP05-Data.csv", skip = 1)
GINI.2010.c = read.csv("ACS Data/2010/ACSDT1Y2010.GINI.csv", skip = 1)
mortgage.2010.c = read.csv("ACS Data/2010/Mortgage.csv", skip = 1)

house.2011.c = read.csv("ACS Data/2011/Housing.csv", skip = 1)
inc.2011.c = read.csv("ACS Data/2011/Quant.csv", skip = 1)
dp2.2011.c = read.csv("ACS Data/2011/ACSDP1Y2011.DP02-Data.csv", skip = 1)
dp3.2011.c = read.csv("ACS Data/2011/ACSDP1Y2011.DP03-Data.csv", skip = 1)
dp4.2011.c = read.csv("ACS Data/2011/ACSDP1Y2011.DP04-Data.csv", skip = 1)
dp5.2011.c = read.csv("ACS Data/2011/ACSDP1Y2011.DP05-Data.csv", skip = 1)
GINI.2011.c = read.csv("ACS Data/2011/GINI.csv", skip = 1)
mortgage.2011.c = read.csv("ACS Data/2011/Mortgage.csv", skip = 1)

house.2012.c = read.csv("ACS Data/2012/Housing.csv", skip = 1)
inc.2012.c = read.csv("ACS Data/2012/Quant.csv", skip = 1)
dp2.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP02-Data.csv", skip = 1)
dp3.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP03-Data.csv", skip = 1)
dp4.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP04-Data.csv", skip = 1)
dp5.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP05-Data.csv", skip = 1)
GINI.2012.c = read.csv("ACS Data/2012/ACSDT1Y2012.GINI.csv", skip = 1)
mortgage.2012.c = read.csv("ACS Data/2012/Mortgage.csv", skip = 1)

house.2013.c = read.csv("ACS Data/2013/Housing.csv", skip = 1)
inc.2013.c = read.csv("ACS Data/2013/Quant.csv", skip = 1)
dp2.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP02-Data.csv", skip = 1)
dp3.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP03-Data.csv", skip = 1)
dp4.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP04-Data.csv", skip = 1)
dp5.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP05-Data.csv", skip = 1)
GINI.2013.c = read.csv("ACS Data/2013/ACSDT1Y2013.GINI.csv", skip = 1)
mortgage.2013.c = read.csv("ACS Data/2013/Mortgage.csv", skip = 1)

house.2014.c = read.csv("ACS Data/2014/Housing.csv", skip = 1)
inc.2014.c = read.csv("ACS Data/2014/Quant.csv", skip = 1)
dp2.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP02-Data.csv", skip = 1)
dp3.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP03-Data.csv", skip = 1)
dp4.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP04-Data.csv", skip = 1)
dp5.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP05-Data.csv", skip = 1)
GINI.2014.c = read.csv("ACS Data/2014/ACSDT1Y2014.GINI.csv", skip = 1)
mortgage.2014.c = read.csv("ACS Data/2014/Mortgage.csv", skip = 1)

house.2015.c = read.csv("ACS Data/2015/Housing.csv", skip = 1)
inc.2015.c = read.csv("ACS Data/2015/Quant.csv", skip = 1)
dp2.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP02-Data.csv", skip = 1)
dp3.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP03-Data.csv", skip = 1)
dp4.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP04-Data.csv", skip = 1)
dp5.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP05-Data.csv", skip = 1)
GINI.2015.c = read.csv("ACS Data/2015/ACSDT1Y2015.GINI.csv", skip = 1)
mortgage.2015.c = read.csv("ACS Data/2015/Mortgage.csv", skip = 1)

house.2016.c = read.csv("ACS Data/2016/Housing.csv", skip = 1)
inc.2016.c = read.csv("ACS Data/2016/Quant.csv", skip = 1)
dp2.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP02-Data.csv", skip = 1)
dp3.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP03-Data.csv", skip = 1)
dp4.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP04-Data.csv", skip = 1)
dp5.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP05-Data.csv", skip = 1)
GINI.2016.c = read.csv("ACS Data/2016/ACSDT1Y2016.GINI.csv", skip = 1)
mortgage.2016.c = read.csv("ACS Data/2016/Mortgage.csv", skip = 1)

house.2017.c = read.csv("ACS Data/2017/Housing.csv", skip = 1)
inc.2017.c = read.csv("ACS Data/2017/Quant.csv", skip = 1)
dp2.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP02-Data.csv", skip = 1)
dp3.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP03-Data.csv", skip = 1)
dp4.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP04-Data.csv", skip = 1)
dp5.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP05-Data.csv", skip = 1)
GINI.2017.c = read.csv("ACS Data/2017/ACSDT1Y2017.GINI.csv", skip = 1)
mortgage.2017.c = read.csv("ACS Data/2017/Mortgage.csv", skip = 1)

house.2018.c = read.csv("ACS Data/2018/Housing.csv", skip = 1)
inc.2018.c = read.csv("ACS Data/2018/Quant.csv", skip = 1)
dp2.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP02-Data.csv", skip = 1)
dp3.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP03-Data.csv", skip = 1)
dp4.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP04-Data.csv", skip = 1)
dp5.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP05-Data.csv", skip = 1)
GINI.2018.c = read.csv("ACS Data/2018/ACSDT1Y2018.GINI.csv", skip = 1)
mortgage.2018.c = read.csv("ACS Data/2018/Mortgage.csv", skip = 1)

house.2019.c = read.csv("ACS Data/2019/Housing.csv", skip = 1)
inc.2019.c = read.csv("ACS Data/2019/Quant.csv", skip = 1)
dp2.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP02-Data.csv", skip = 1)
dp3.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP03-Data.csv", skip = 1)
dp4.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP04-Data.csv", skip = 1)
dp5.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP05-Data.csv", skip = 1)
GINI.2019.c = read.csv("ACS Data/2019/ACSDT1Y2019.GINI.csv", skip = 1)
mortgage.2019.c = read.csv("ACS Data/2019/Mortgage.csv", skip = 1)

house.2021.c = read.csv("ACS Data/2021/Housing.csv", skip = 1)
inc.2021.c = read.csv("ACS Data/2021/Quant.csv", skip = 1)
dp2.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP02-Data.csv", skip = 1)
dp3.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP03-Data.csv", skip = 1)
dp4.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP04-Data.csv", skip = 1)
dp5.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP05-Data.csv", skip = 1)
GINI.2021.c = read.csv("ACS Data/2021/ACSDT1Y2021.GINI.csv", skip = 1)
mortgage.2021.c = read.csv("ACS Data/2021/Mortgage.csv", skip = 1)

house.2022.c = read.csv("ACS Data/2022/Housing.csv", skip = 1)
inc.2022.c = read.csv("ACS Data/2022/Quant.csv", skip = 1)
dp2.2022.c = read.csv("ACS Data/2022/ACSDP1Y2022.DP02-Data.csv", skip = 1)
dp3.2022.c = read.csv("ACS Data/2022/ACSDP1Y2022.DP03-Data.csv", skip = 1)
dp4.2022.c = read.csv("ACS Data/2022/ACSDP1Y2022.DP04-Data.csv", skip = 1)
dp5.2022.c = read.csv("ACS Data/2022/ACSDP1Y2022.DP05-Data.csv", skip = 1)
GINI.2022.c = read.csv("ACS Data/2022/GINI.csv", skip = 1)
mortgage.2022.c = read.csv("ACS Data/2022/Mortgage.csv", skip = 1)

#If the input dataset will not contain specified search term, returns false
zero_checker = function(search.term, dataset){
  !(is.integer(grep(search.term, colnames(dataset), ignore.case = TRUE)) && length(grep(search.term, colnames(dataset), ignore.case = TRUE)) == 0L)
}


#I need to change state to geographic area name and add in a variable specifying country, state, county
#-------------------------------------------------

dataclean = function(dataset){
  #all of these use zero_checker to make sure I don't accidentally remove all columns
  #Removes margins of error and annotations which are not useful
  if(zero_checker("Margin.of.Error",dataset)){
  dataset = dataset[,-(grep("Margin.of.Error", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("Annotation", dataset)){
  dataset = dataset[,-(grep("Annotation", colnames(dataset), ignore.case = TRUE))]}
  #I will not be using anything to do with race
  if(zero_checker("race", dataset)){
  dataset = dataset[,-(grep("race", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("fertility", dataset)){
    dataset = dataset[,-(grep("fertility", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("place.of.birth", dataset)){
    dataset = dataset[,-(grep("place.of.birth", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("foreign.born", dataset)){
    dataset = dataset[,-(grep("foreign.born", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("language", dataset)){
    dataset = dataset[,-(grep("language", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("ancestry", dataset)){
    dataset = dataset[,-(grep("ancestry", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("health.insurance", dataset)){
    dataset = dataset[,-(grep("health.insurance", colnames(dataset), ignore.case = TRUE))]}
  
  return(dataset)
}

#Uses the above function to merge all specified data sets into one after cleaning
#Also remove Puerto Rico
datamerge = function(dp2, dp3, dp4, dp5, GINI, house, inc, mortgage, end_name, year){
  dp2 = dataclean(dp2)
  dp3 = dataclean(dp3)
  dp4 = dataclean(dp4)
  dp5 = dataclean(dp5)
  house = dataclean(house)
  inc = dataclean(inc)
  mort = dataclean(mortgage)
  dflist = list(dp2, dp3, dp4, dp5, GINI, house, inc, mortgage)
  end_name = Reduce(function(x,y) merge(x,y, all=TRUE), dflist)
  end_name = end_name[-53,]
  year = rep(year, nrow(end_name))
  region = rep(0, nrow(end_name))
  end_name = cbind(end_name, year, region)
  colnames(end_name)[1] = "state"
  
  #sadly every state needs to be done individually
  end_name = end_name %>%
    mutate(
      region = case_when(
        Geographic.Area.Name == "Connecticut" | Geographic.Area.Name == "Maine" | Geographic.Area.Name == "Massachusetts" | Geographic.Area.Name == "New Hampshire" |
          Geographic.Area.Name == "New Jersey" | Geographic.Area.Name == "New York" | Geographic.Area.Name == "Pennsylvania" | Geographic.Area.Name == "Rhode Island" |
          Geographic.Area.Name == "Vermont" ~ 1,
        Geographic.Area.Name == "Illinois" | Geographic.Area.Name == "Indiana" | Geographic.Area.Name == "Iowa" | Geographic.Area.Name == "Kansas" | Geographic.Area.Name == "Michigan" |
          Geographic.Area.Name == "Minnesota" | Geographic.Area.Name == "Missouri" | Geographic.Area.Name == "Nebraska" | Geographic.Area.Name == "North Dakota" |
          Geographic.Area.Name == "Ohio" | Geographic.Area.Name == "South Dakota" | Geographic.Area.Name == "Wisconsin" ~ 2,
        Geographic.Area.Name == "Alabama" | Geographic.Area.Name == "Arkansas" | Geographic.Area.Name == "Delaware" | Geographic.Area.Name == "Florida" |
          Geographic.Area.Name == "Georgia" | Geographic.Area.Name == "Kentucky" | Geographic.Area.Name == "Louisiana" | Geographic.Area.Name == "Maryland" |
          Geographic.Area.Name == "Mississippi" | Geographic.Area.Name == "North Carolina" | Geographic.Area.Name == "Oklahoma" | Geographic.Area.Name == "South Carolina" |
          Geographic.Area.Name == "Tennessee" | Geographic.Area.Name == "Texas" | Geographic.Area.Name == "Virginia" | Geographic.Area.Name == "District of Columbia" |
          Geographic.Area.Name == "West Virginia" ~ 3,
        Geographic.Area.Name == "Alaska" | Geographic.Area.Name == "Arizona" | Geographic.Area.Name == "California" | Geographic.Area.Name == "Colorado" |
          Geographic.Area.Name == "Hawaii" | Geographic.Area.Name == "Idaho" | Geographic.Area.Name == "Montana" | Geographic.Area.Name == "Nevada" |
          Geographic.Area.Name == "New Mexico" | Geographic.Area.Name == "Oregon" | Geographic.Area.Name == "Utah" | Geographic.Area.Name == "Washington" |
          Geographic.Area.Name == "Wyoming" ~ 4
      )
    )
  return(end_name)
}


#Get cleaned data for each year
cleaned2010 = datamerge(dp2.2010.c, dp3.2010.c, dp4.2010.c, dp5.2010.c, GINI.2010.c, house.2010.c, inc.2010.c, mortgage.2010.c, cleaned2010, 2010)
cleaned2011 = datamerge(dp2.2011.c, dp3.2011.c, dp4.2011.c, dp5.2011.c, GINI.2011.c, house.2011.c, inc.2011.c, mortgage.2011.c, cleaned2011, 2011)
cleaned2012 = datamerge(dp2.2012.c, dp3.2012.c, dp4.2012.c, dp5.2012.c, GINI.2012.c, house.2012.c, inc.2012.c, mortgage.2012.c, cleaned2012, 2012)
cleaned2013 = datamerge(dp2.2013.c, dp3.2013.c, dp4.2013.c, dp5.2013.c, GINI.2013.c, house.2013.c, inc.2013.c, mortgage.2013.c, cleaned2013, 2013)
cleaned2014 = datamerge(dp2.2014.c, dp3.2014.c, dp4.2014.c, dp5.2014.c, GINI.2014.c, house.2014.c, inc.2014.c, mortgage.2014.c, cleaned2014, 2014)
cleaned2015 = datamerge(dp2.2015.c, dp3.2015.c, dp4.2015.c, dp5.2015.c, GINI.2015.c, house.2015.c, inc.2015.c, mortgage.2015.c, cleaned2015, 2015)
cleaned2016 = datamerge(dp2.2016.c, dp3.2016.c, dp4.2016.c, dp5.2016.c, GINI.2016.c, house.2016.c, inc.2016.c, mortgage.2016.c, cleaned2016, 2016)
cleaned2017 = datamerge(dp2.2017.c, dp3.2017.c, dp4.2017.c, dp5.2017.c, GINI.2017.c, house.2017.c, inc.2017.c, mortgage.2017.c, cleaned2017, 2017)
cleaned2018 = datamerge(dp2.2018.c, dp3.2018.c, dp4.2018.c, dp5.2018.c, GINI.2018.c, house.2018.c, inc.2018.c, mortgage.2018.c, cleaned2018, 2018)
cleaned2019 = datamerge(dp2.2019.c, dp3.2019.c, dp4.2019.c, dp5.2019.c, GINI.2019.c, house.2019.c, inc.2019.c, mortgage.2019.c, cleaned2019, 2019)
cleaned2021 = datamerge(dp2.2021.c, dp3.2021.c, dp4.2021.c, dp5.2021.c, GINI.2021.c, house.2021.c, inc.2021.c, mortgage.2021.c, cleaned2021, 2021)
cleaned2022 = datamerge(dp2.2022.c, dp3.2022.c, dp4.2022.c, dp5.2022.c, GINI.2022.c, house.2022.c, inc.2022.c, mortgage.2022.c, cleaned2022, 2022)


#------------------------
#Extract targeted data to merge
#------------------------

#2010 data lacks population characteristics
#lacks cohabitating households


#isolate above 18 population statistics

dp.2010 = cleaned2010[,c("state", 'Geographic.Area.Name', 'year', 'region',
                     'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over',
                     'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS....200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Family.households..families...Married.couple.family',
                     #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Graduate.or.professional.degree',
                     'Estimate..HOUSING.TENURE..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.renter.occupied.unit',
                     'Estimate..SEX.AND.AGE..18.years.and.over',
                     'Estimate..SEX.AND.AGE..65.years.and.over',
                     'Estimate..Gini.Index',
                     'Estimate..Quintile.Means..Lowest.Quintile',
                     'Estimate..Quintile.Means..Second.Quintile',
                     'Estimate..Quintile.Means..Third.Quintile',
                     'Estimate..Quintile.Means..Fourth.Quintile',
                     'Estimate..Quintile.Means..Highest.Quintile',
                     'Estimate..Top.5.Percent',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more'
                     )]

dp.2011 = cleaned2011[,c("state", 'Geographic.Area.Name', 'year', 'region',
                         'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over',
                         'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS...Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2011.INFLATION.ADJUSTED.DOLLARS....200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Family.households..families...Married.couple.family',
                         #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Graduate.or.professional.degree',
                         'Estimate..HOUSING.TENURE..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.renter.occupied.unit',
                         'Estimate..SEX.AND.AGE..18.years.and.over',
                         'Estimate..SEX.AND.AGE..65.years.and.over',
                         'Estimate..Gini.Index',
                         'Estimate..Quintile.Means..Lowest.Quintile',
                         'Estimate..Quintile.Means..Second.Quintile',
                         'Estimate..Quintile.Means..Third.Quintile',
                         'Estimate..Quintile.Means..Fourth.Quintile',
                         'Estimate..Quintile.Means..Highest.Quintile',
                         'Estimate..Top.5.Percent',
                         'Estimate..Total..With.a.mortgage..Less.than..20.000',
                         'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                         'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                         'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                         'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                         'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                         'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                         'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                         'Estimate..Total..With.a.mortgage...75.000.or.more',
                         'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]




dp.2012 = cleaned2012[,c("state", 'Geographic.Area.Name', 'year', 'region',
                     'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..In.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS...Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2012.INFLATION.ADJUSTED.DOLLARS....200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Family.households..families...Married.couple.family',
                     #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Graduate.or.professional.degree',
                     'Estimate..HOUSING.TENURE..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.renter.occupied.unit',
                     'Estimate..SEX.AND.AGE..18.years.and.over',
                     'Estimate..SEX.AND.AGE..65.years.and.over',
                     'Estimate..Gini.Index',
                     'Estimate..Quintile.Means..Lowest.Quintile',
                     'Estimate..Quintile.Means..Second.Quintile',
                     'Estimate..Quintile.Means..Third.Quintile',
                     'Estimate..Quintile.Means..Fourth.Quintile',
                     'Estimate..Quintile.Means..Highest.Quintile',
                     'Estimate..Top.5.Percent',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]


dp.2013 = cleaned2013[,c("state", 'Geographic.Area.Name', 'year', 'region',
                     'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2013.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                    # 'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                    'Estimate..SEX.AND.AGE..18.years.and.over',
                    'Estimate..SEX.AND.AGE..65.years.and.over',
                    'Estimate..Gini.Index',
                    'Estimate..Quintile.Means..Lowest.Quintile',
                    'Estimate..Quintile.Means..Second.Quintile',
                    'Estimate..Quintile.Means..Third.Quintile',
                    'Estimate..Quintile.Means..Fourth.Quintile',
                    'Estimate..Quintile.Means..Highest.Quintile',
                    'Estimate..Top.5.Percent',
                    'Estimate..Total..With.a.mortgage..Less.than..20.000',
                    'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                    'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                    'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                    'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                    'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                    'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                    'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                    'Estimate..Total..With.a.mortgage...75.000.or.more',
                    'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]


dp.2014 = cleaned2014[,c("state", 'Geographic.Area.Name', 'year', 'region',
                     'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2014.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                     #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..SEX.AND.AGE..18.years.and.over',
                     'Estimate..SEX.AND.AGE..65.years.and.over',
                     'Estimate..Gini.Index',
                     'Estimate..Quintile.Means..Lowest.Quintile',
                     'Estimate..Quintile.Means..Second.Quintile',
                     'Estimate..Quintile.Means..Third.Quintile',
                     'Estimate..Quintile.Means..Fourth.Quintile',
                     'Estimate..Quintile.Means..Highest.Quintile',
                     'Estimate..Top.5.Percent',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]


dp.2015 = cleaned2015[,c("state", 'Geographic.Area.Name', 'year', 'region',
                     'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2015.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                     #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                     'Estimate..SEX.AND.AGE..18.years.and.over',
                     'Estimate..SEX.AND.AGE..65.years.and.over',
                     'Estimate..Gini.Index',
                     'Estimate..Quintile.Means..Lowest.Quintile',
                     'Estimate..Quintile.Means..Second.Quintile',
                     'Estimate..Quintile.Means..Third.Quintile',
                     'Estimate..Quintile.Means..Fourth.Quintile',
                     'Estimate..Quintile.Means..Highest.Quintile',
                     'Estimate..Top.5.Percent',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000',
                     'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                     'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                     'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                     'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more',
                     'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]


dp.2016 = cleaned2016[,c("state", 'Geographic.Area.Name', 'year', 'region',
                         'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2016.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                         #'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                        'Estimate..SEX.AND.AGE..18.years.and.over',
                        'Estimate..SEX.AND.AGE..65.years.and.over',
                        'Estimate..Gini.Index',
                        'Estimate..Quintile.Means..Lowest.Quintile',
                        'Estimate..Quintile.Means..Second.Quintile',
                        'Estimate..Quintile.Means..Third.Quintile',
                        'Estimate..Quintile.Means..Fourth.Quintile',
                        'Estimate..Quintile.Means..Highest.Quintile',
                        'Estimate..Top.5.Percent',
                        'Estimate..Total..With.a.mortgage..Less.than..20.000',
                        'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                        'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                        'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                        'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...75.000.or.more',
                        'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]

dp.2017 = cleaned2017[,c("state", 'Geographic.Area.Name', 'year', 'region',
                         'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2017.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                        # 'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                        # 'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                        # 'Estimate..HOUSING.TENURE..Occupied.housing.units',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Average.household.size.of.owner.occupied.unit',
                        'Estimate..SEX.AND.AGE..18.years.and.over',
                        'Estimate..SEX.AND.AGE..65.years.and.over',
                        'Estimate..Gini.Index',
                        'Estimate..Quintile.Means..Lowest.Quintile',
                        'Estimate..Quintile.Means..Second.Quintile',
                        'Estimate..Quintile.Means..Third.Quintile',
                        'Estimate..Quintile.Means..Fourth.Quintile',
                        'Estimate..Quintile.Means..Highest.Quintile',
                        'Estimate..Top.5.Percent',
                        'Estimate..Total..With.a.mortgage..Less.than..20.000',
                        'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                        'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                        'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                        'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                        'Estimate..Total..With.a.mortgage...75.000.or.more',
                        'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]

dp.2018 = cleaned2018[,c("state", 'Geographic.Area.Name', 'year', 'region',
                         'Estimate..UNITS.IN.STRUCTURE..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2018.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Family.households..families...Married.couple.family',
                       #  'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                      #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                      #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                      #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                      #   'Estimate..HOUSING.TENURE..Occupied.housing.units',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..SEX.AND.AGE..Total.population..18.years.and.over',
                      'Estimate..SEX.AND.AGE..Total.population..65.years.and.over',
                      'Estimate..Gini.Index',
                      'Estimate..Quintile.Means..Lowest.Quintile',
                      'Estimate..Quintile.Means..Second.Quintile',
                      'Estimate..Quintile.Means..Third.Quintile',
                      'Estimate..Quintile.Means..Fourth.Quintile',
                      'Estimate..Quintile.Means..Highest.Quintile',
                      'Estimate..Top.5.Percent',
                      'Estimate..Total..With.a.mortgage..Less.than..20.000',
                      'Estimate..Total..With.a.mortgage..Less.than..20.000..30.percent.or.more',
                      'Estimate..Total..With.a.mortgage...20.000.to..34.999',
                      'Estimate..Total..With.a.mortgage...20.000.to..34.999..30.percent.or.more',
                      'Estimate..Total..With.a.mortgage...35.000.to..49.999',
                      'Estimate..Total..With.a.mortgage...35.000.to..49.999..30.percent.or.more',
                      'Estimate..Total..With.a.mortgage...50.000.to..74.999',
                      'Estimate..Total..With.a.mortgage...50.000.to..74.999..30.percent.or.more',
                      'Estimate..Total..With.a.mortgage...75.000.or.more',
                      'Estimate..Total..With.a.mortgage...75.000.or.more..30.percent.or.more')]

dp.2019 = cleaned2019[,c("state", 'Geographic.Area.Name', 'year', 'region', 
                     'Estimate..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'Estimate..INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 
                     'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.family',
                   #  'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                  #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                  #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                  #   'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                  #   'Estimate..HOUSING.TENURE..Occupied.housing.units',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                     'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                     'Estimate..SEX.AND.AGE..Total.population..18.years.and.over',
                  'Estimate..SEX.AND.AGE..Total.population..65.years.and.over',
                  'Estimate..Gini.Index',
                  'Estimate..Quintile.Means...Lowest.Quintile',
                  'Estimate..Quintile.Means...Second.Quintile',
                  'Estimate..Quintile.Means...Third.Quintile',
                  'Estimate..Quintile.Means...Fourth.Quintile',
                  'Estimate..Quintile.Means...Highest.Quintile',
                  'Estimate..Top.5.Percent',
                  'Estimate..Total...With.a.mortgage...Less.than..20.000.',
                  'Estimate..Total...With.a.mortgage...Less.than..20.000...30.percent.or.more',
                  'Estimate..Total...With.a.mortgage....20.000.to..34.999.',
                  'Estimate..Total...With.a.mortgage....20.000.to..34.999...30.percent.or.more',
                  'Estimate..Total...With.a.mortgage....35.000.to..49.999.',
                  'Estimate..Total...With.a.mortgage....35.000.to..49.999...30.percent.or.more',
                  'Estimate..Total...With.a.mortgage....50.000.to..74.999.',
                  'Estimate..Total...With.a.mortgage....50.000.to..74.999...30.percent.or.more',
                  'Estimate..Total...With.a.mortgage....75.000.or.more.',
                  'Estimate..Total...With.a.mortgage....75.000.or.more...30.percent.or.more'
                  )]



dp.2021 = cleaned2021[,c("state", 'Geographic.Area.Name' ,'year', 'region', 
                         #'Estimate..SEX.AND.AGE..Total.population', 'Estimate..SEX.AND.AGE..Total.population..Under.18.years',
                         #'Estimate..SEX.AND.AGE..Total.population..18.years.and.over', 'Estimate..SEX.AND.AGE..Total.population..62.years.and.over',
                         'Estimate..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.household',
                     #    'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Cohabiting.couple.household',
                     #    'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                    #    'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                    #     'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                    #     'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                    #     'Estimate..HOUSING.TENURE..Occupied.housing.units',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..SEX.AND.AGE..Total.population..18.years.and.over',
                          'Estimate..SEX.AND.AGE..Total.population..65.years.and.over',
                          'Estimate..Gini.Index',
                          'Estimate..Quintile.Means...Lowest.Quintile',
                          'Estimate..Quintile.Means...Second.Quintile',
                          'Estimate..Quintile.Means...Third.Quintile',
                          'Estimate..Quintile.Means...Fourth.Quintile',
                          'Estimate..Quintile.Means...Highest.Quintile',
                          'Estimate..Top.5.Percent',
                          'Estimate..Total...With.a.mortgage...Less.than..20.000.',
                          'Estimate..Total...With.a.mortgage...Less.than..20.000...30.percent.or.more',
                          'Estimate..Total...With.a.mortgage....20.000.to..34.999.',
                          'Estimate..Total...With.a.mortgage....20.000.to..34.999...30.percent.or.more',
                          'Estimate..Total...With.a.mortgage....35.000.to..49.999.',
                          'Estimate..Total...With.a.mortgage....35.000.to..49.999...30.percent.or.more',
                          'Estimate..Total...With.a.mortgage....50.000.to..74.999.',
                          'Estimate..Total...With.a.mortgage....50.000.to..74.999...30.percent.or.more',
                          'Estimate..Total...With.a.mortgage....75.000.or.more.',
                          'Estimate..Total...With.a.mortgage....75.000.or.more...30.percent.or.more')]

dp.2022 = cleaned2022[,c("state", 'Geographic.Area.Name' ,'year', 'region', 
                         #'Estimate..SEX.AND.AGE..Total.population', 'Estimate..SEX.AND.AGE..Total.population..Under.18.years',
                         #'Estimate..SEX.AND.AGE..Total.population..18.years.and.over', 'Estimate..SEX.AND.AGE..Total.population..62.years.and.over',
                         'Estimate..Total.housing.units', 'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                         'Estimate..EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                         'Estimate..INCOME.AND.BENEFITS..IN.2022.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                         'Estimate..HOUSEHOLDS.BY.TYPE..Total.households', 'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.household',
                         #    'Estimate..HOUSEHOLDS.BY.TYPE..Total.households..Cohabiting.couple.household',
                         #    'Estimate..MARITAL.STATUS..Males.15.years.and.over', 'Estimate..MARITAL.STATUS..Females.15.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                         'Estimate..EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                         #    'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households',
                         #     'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                         #     'Estimate..COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription',
                         #     'Estimate..HOUSING.TENURE..Occupied.housing.units',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Owner.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Renter.occupied',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..HOUSING.TENURE..Occupied.housing.units..Average.household.size.of.owner.occupied.unit',
                         'Estimate..SEX.AND.AGE..Total.population..18.years.and.over',
                         'Estimate..SEX.AND.AGE..Total.population..65.years.and.over',
                         'Estimate..Gini.Index',
                         'Estimate..Quintile.Means...Lowest.Quintile',
                         'Estimate..Quintile.Means...Second.Quintile',
                         'Estimate..Quintile.Means...Third.Quintile',
                         'Estimate..Quintile.Means...Fourth.Quintile',
                         'Estimate..Quintile.Means...Highest.Quintile',
                         'Estimate..Top.5.Percent',
                         'Estimate..Total...With.a.mortgage...Less.than..20.000.',
                         'Estimate..Total...With.a.mortgage...Less.than..20.000...30.percent.or.more',
                         'Estimate..Total...With.a.mortgage....20.000.to..34.999.',
                         'Estimate..Total...With.a.mortgage....20.000.to..34.999...30.percent.or.more',
                         'Estimate..Total...With.a.mortgage....35.000.to..49.999.',
                         'Estimate..Total...With.a.mortgage....35.000.to..49.999...30.percent.or.more',
                         'Estimate..Total...With.a.mortgage....50.000.to..74.999.',
                         'Estimate..Total...With.a.mortgage....50.000.to..74.999...30.percent.or.more',
                         'Estimate..Total...With.a.mortgage....75.000.or.more.',
                         'Estimate..Total...With.a.mortgage....75.000.or.more...30.percent.or.more')]

#-----------------------
#State level alter
#-----------------------
name_align.s = function(df, new_name){
  new_name = df %>% 
    rename(county = 2,
           total.housing = 5,
           employable.pop = 6,
           total.pop.labor = 7,
           employed.pop.labor = 8,
           total.income.benefits = 9,
           inc.0.10 = 10,
           inc.10.15 = 11,
           inc.15.25 = 12,
           inc.25.35 = 13,
           inc.35.50 = 14,
           inc.50.75 = 15,
           inc.75.100 = 16,
           inc.100.150 = 17,
           inc.150.200 = 18,
           inc.200.abv = 19,
           total.households = 20,
           couple.housing = 21,
           #marital status currently commented out due to bad stat, downshift and adjust when needed
           total.educ = 22,
           educ.9th = 23,
           educ.no.dip = 24,
           educ.dip = 25,
           educ.col.no.deg = 26,
           educ.associate = 27,
           educ.bachelor = 28,
           educ.graduate.deg = 29,
           owner = 30,
           renter = 31,
           owner.hh.size = 32,
           renter.hh.size = 33,
           over.18.pop = 34,
           over.65.pop =35,
           GINI = 36,
           first.quant = 37,
           second.quant = 38,
           third.quant = 39,
           fourth.quant = 40,
           fifth.quant = 41,
           top5 = 42,
           mort.20 = 43,
           mort.20.30 = 44,
           mort.20.35 = 45, 
           mort.20.35.30 = 46,
           mort.35.50 = 47,
           mort.35.50.30 = 48,
           mort.50.75 = 49,
           mort.50.75.30 = 50,
           mort.75 = 51, 
           mort.75.30 = 52
    )
  #commented out, cuts all non-country observations
  new_name = subset(new_name[(2:53),])
  return(new_name)
}

merge10s = name_align.s(dp.2010, merge10)
merge11s = name_align.s(dp.2011, merge10)
merge12s = name_align.s(dp.2012, merge12)
merge13s = name_align.s(dp.2013, merge13)
merge14s = name_align.s(dp.2014, merge14)
merge15s = name_align.s(dp.2015, merge15)
merge16s = name_align.s(dp.2016, merge16)
merge17s = name_align.s(dp.2017, merge17)
merge18s = name_align.s(dp.2018, merge18)
merge19s = name_align.s(dp.2019, merge19)
merge21s = name_align.s(dp.2021, merge21)
merge22s = name_align.s(dp.2022, merge21)


#Rechain all values to 2010 dollars
#Use January 1st numbers
#this just breaks as a function, do manually, may look at later

#rechain.2010 = function(df, cpi.new){
#  n = nrow(df)
#  for(i in 1:n){
#  df[i,37] = df[i,37] * cpi.new/217.488
#  df[i,38] = df[i,38] * cpi.new/217.488
#  df[i,39] = df[i,39] * cpi.new/217.488
#  df[i,40] = df[i,40] * cpi.new/217.488
#  df[i,41] = df[i,41] * cpi.new/217.488
#  df[i,42] = df[i,42] * cpi.new/217.488
#}}

#variables to fix, all quantiles, top 5, other 
#divide by 217.488 to chain
#2011 221.187
#merge11s$first.quant = merge11s$first.quant * 221.187/217.488
#merge11s$second.quant = merge11s$second.quant * 221.187/217.488
#merge11s$third.quant = merge11s$third.quant * 221.187/217.488
#merge11s$fourth.quant = merge11s$fourth.quant * 221.187/217.488
#merge11s$fifth.quant = merge11s$fifth.quant * 221.187/217.488
#merge11s$top5 = merge11s$top5 * 221.187/217.488
#rechain.2010(merge11s, 221.187)

for(i in 1:n){
  merge11s[i,37] = merge11s[i,37] * 221.187/217.488
  merge11s[i,38] = merge11s[i,38] * 221.187/217.488
  merge11s[i,39] = merge11s[i,39] * 221.187/217.488
  merge11s[i,40] = merge11s[i,40] * 221.187/217.488
  merge11s[i,41] = merge11s[i,41] * 221.187/217.488
  merge11s[i,42] = merge11s[i,42] * 221.187/217.488
}

#2012 227.842
#merge12s$first.quant = merge12s$first.quant * 227.842/217.488
#merge12s$second.quant = merge12s$second.quant * 227.842/217.488
#merge12s$third.quant = merge12s$third.quant * 227.842/217.488
#merge12s$fourth.quant = merge12s$fourth.quant * 227.842/217.488
#merge12s$fifth.quant = merge12s$fifth.quant * 227.842/217.488
#merge12s$top5 = merge12s$top5 * 227.842/217.488
for(i in 1:n){
  merge12s[i,37] = merge12s[i,37] * 227.842/217.488
  merge12s[i,38] = merge12s[i,38] * 227.842/217.488
  merge12s[i,39] = merge12s[i,39] * 227.842/217.488
  merge12s[i,40] = merge12s[i,40] * 227.842/217.488
  merge12s[i,41] = merge12s[i,41] * 227.842/217.488
  merge12s[i,42] = merge12s[i,42] * 227.842/217.488
}
#2013 231.679
for(i in 1:n){
  merge13s[i,37] = merge13s[i,37] * 231.679/217.488
  merge13s[i,38] = merge13s[i,38] * 231.679/217.488
  merge13s[i,39] = merge13s[i,39] * 231.679/217.488
  merge13s[i,40] = merge13s[i,40] * 231.679/217.488
  merge13s[i,41] = merge13s[i,41] * 231.679/217.488
  merge13s[i,42] = merge13s[i,42] * 231.679/217.488
}

#2014 235.288
for(i in 1:n){
  merge14s[i,37] = merge14s[i,37] * 235.288/217.488
  merge14s[i,38] = merge14s[i,38] * 235.288/217.488
  merge14s[i,39] = merge14s[i,39] * 235.288/217.488
  merge14s[i,40] = merge14s[i,40] * 235.288/217.488
  merge14s[i,41] = merge14s[i,41] * 235.288/217.488
  merge14s[i,42] = merge14s[i,42] * 235.288/217.488
}

#2015 234.747
for(i in 1:n){
  merge15s[i,37] = merge15s[i,37] * 234.747/217.488
  merge15s[i,38] = merge15s[i,38] * 234.747/217.488
  merge15s[i,39] = merge15s[i,39] * 234.747/217.488
  merge15s[i,40] = merge15s[i,40] * 234.747/217.488
  merge15s[i,41] = merge15s[i,41] * 234.747/217.488
  merge15s[i,42] = merge15s[i,42] * 234.747/217.488
}

#2016 237.652
for(i in 1:n){
  merge16s[i,37] = merge16s[i,37] * 237.652/217.488
  merge16s[i,38] = merge16s[i,38] * 237.652/217.488
  merge16s[i,39] = merge16s[i,39] * 237.652/217.488
  merge16s[i,40] = merge16s[i,40] * 237.652/217.488
  merge16s[i,41] = merge16s[i,41] * 237.652/217.488
  merge16s[i,42] = merge16s[i,42] * 237.652/217.488
}

#2017 243.618
for(i in 1:n){
  merge17s[i,37] = merge17s[i,37] * 243.618/217.488
  merge17s[i,38] = merge17s[i,38] * 243.618/217.488
  merge17s[i,39] = merge17s[i,39] * 243.618/217.488
  merge17s[i,40] = merge17s[i,40] * 243.618/217.488
  merge17s[i,41] = merge17s[i,41] * 243.618/217.488
  merge17s[i,42] = merge17s[i,42] * 243.618/217.488
}

#2018 248.859
for(i in 1:n){
  merge18s[i,37] = merge18s[i,37] * 248.859/217.488
  merge18s[i,38] = merge18s[i,38] * 248.859/217.488
  merge18s[i,39] = merge18s[i,39] * 248.859/217.488
  merge18s[i,40] = merge18s[i,40] * 248.859/217.488
  merge18s[i,41] = merge18s[i,41] * 248.859/217.488
  merge18s[i,42] = merge18s[i,42] * 248.859/217.488
}

#2019 252.718
for(i in 1:n){
  merge19s[i,37] = merge19s[i,37] * 252.718/217.488
  merge19s[i,38] = merge19s[i,38] * 252.718/217.488
  merge19s[i,39] = merge19s[i,39] * 252.718/217.488
  merge19s[i,40] = merge19s[i,40] * 252.718/217.488
  merge19s[i,41] = merge19s[i,41] * 252.718/217.488
  merge19s[i,42] = merge19s[i,42] * 252.718/217.488
}

#2021 262.650
for(i in 1:n){
  merge21s[i,37] = merge21s[i,37] * 262.650/217.488
  merge21s[i,38] = merge21s[i,38] * 262.650/217.488
  merge21s[i,39] = merge21s[i,39] * 262.650/217.488
  merge21s[i,40] = merge21s[i,40] * 262.650/217.488
  merge21s[i,41] = merge21s[i,41] * 262.650/217.488
  merge21s[i,42] = merge21s[i,42] * 262.650/217.488
}

#2022 282.599
for(i in 1:n){
  merge22s[i,37] = merge22s[i,37] * 282.599/217.488
  merge22s[i,38] = merge22s[i,38] * 282.599/217.488
  merge22s[i,39] = merge22s[i,39] * 282.599/217.488
  merge22s[i,40] = merge22s[i,40] * 282.599/217.488
  merge22s[i,41] = merge22s[i,41] * 282.599/217.488
  merge22s[i,42] = merge22s[i,42] * 282.599/217.488
}


mergedf.s = rbind(merge10s, merge11s, merge12s, merge13s, merge14s, merge15s, merge16s, merge17s, merge18s, merge19s, merge21s, merge22s)
