#This file is for combining the American Community Survey 

#Region 1: Northeast
#Connecticut, Maine, Massachusetts, New Hampshire, New Jersey, New York, Pennsylvania
#Rhode Island, Vermont

#Region 2: Midwest
#Illinois, Indiana, Iowa, Kansas, Michigan, Minnesota, Missouri, Nebraska, North Dakota
#Ohio, South Dakota, Wisconsin

#Region 3: South
#Alabama, Arkansas, Delaware, Florida, Georgia, Kentucky, Louisiana, Maryland, Mississippi, 
#North Carolina, Oklahoma, South Carolina, Tennessee, Texas, Virginia, Washington D.C., West Virginia

#Region 4: West
#Alaska, Arizona, California, Colorado, Hawaii, Idaho, Montana, Nevada, New Mexico, Oregon
#Utah, Washington, Wyoming

#Parameters of interest
#Data for 2020 is missing

dp2.2010 = read.csv("ACS Data/2010/DP02.csv")
dp3.2010 = read.csv("ACS Data/2010/DP03.csv")
dp4.2010 = read.csv("ACS Data/2010/DP04.csv")
dp5.2010 = read.csv("ACS Data/2010/DP05.csv")

dp2.2011 = read.csv("ACS Data/2011/DP02.csv", check.names = FALSE)
dp3.2011 = read.csv("ACS Data/2011/DP03.csv", check.names = FALSE)
dp4.2011 = read.csv("ACS Data/2011/DP04.csv", check.names = FALSE)
dp5.2011 = read.csv("ACS Data/2011/DP05.csv", check.names = FALSE)

dp2.2012 = read.csv("ACS Data/2012/DP02.csv", check.names = FALSE)
dp3.2012 = read.csv("ACS Data/2012/DP03.csv", check.names = FALSE)
dp4.2012 = read.csv("ACS Data/2012/DP04.csv", check.names = FALSE)
dp5.2012 = read.csv("ACS Data/2012/DP05.csv", check.names = FALSE)

dp2.2013 = read.csv("ACS Data/2013/DP02.csv", check.names = FALSE)
dp3.2013 = read.csv("ACS Data/2013/DP03.csv", check.names = FALSE)
dp4.2013 = read.csv("ACS Data/2013/DP04.csv", check.names = FALSE)
dp5.2013 = read.csv("ACS Data/2013/DP05.csv", check.names = FALSE)

dp2.2014 = read.csv("ACS Data/2014/DP02.csv", check.names = FALSE)
dp3.2014 = read.csv("ACS Data/2014/DP03.csv", check.names = FALSE)
dp4.2014 = read.csv("ACS Data/2014/DP04.csv", check.names = FALSE)
dp5.2014 = read.csv("ACS Data/2014/DP05.csv", check.names = FALSE)

dp2.2015 = read.csv("ACS Data/2015/DP02.csv", check.names = FALSE)
dp3.2015 = read.csv("ACS Data/2015/DP03.csv", check.names = FALSE)
dp4.2015 = read.csv("ACS Data/2015/DP04.csv", check.names = FALSE)
dp5.2015 = read.csv("ACS Data/2015/DP05.csv", check.names = FALSE)

dp2.2016 = read.csv("ACS Data/2016/DP02.csv", check.names = FALSE)
dp3.2016 = read.csv("ACS Data/2016/DP03.csv", check.names = FALSE)
dp4.2016 = read.csv("ACS Data/2016/DP04.csv", check.names = FALSE)
dp5.2016 = read.csv("ACS Data/2016/DP05.csv", check.names = FALSE)

dp2.2017 = read.csv("ACS Data/2017/DP02.csv", check.names = FALSE)
dp3.2017 = read.csv("ACS Data/2017/DP03.csv", check.names = FALSE)
dp4.2017 = read.csv("ACS Data/2017/DP04.csv", check.names = FALSE)
dp5.2017 = read.csv("ACS Data/2017/DP05.csv", check.names = FALSE)

dp2.2018 = read.csv("ACS Data/2018/DP02.csv", check.names = FALSE)
dp3.2018 = read.csv("ACS Data/2018/DP03.csv", check.names = FALSE)
dp4.2018 = read.csv("ACS Data/2018/DP04.csv", check.names = FALSE)
dp5.2018 = read.csv("ACS Data/2018/DP05.csv", check.names = FALSE)

dp2.2019 = read.csv("ACS Data/2019/DP02.csv")
dp3.2019 = read.csv("ACS Data/2019/DP03.csv")
dp4.2019 = read.csv("ACS Data/2019/DP04.csv")
dp5.2019 = read.csv("ACS Data/2019/DP05.csv")

dp2.2021 = read.csv("ACS Data/2021/DP02.csv", check.names = FALSE)
dp3.2021 = read.csv("ACS Data/2021/DP03.csv", check.names = FALSE)
dp4.2021 = read.csv("ACS Data/2021/DP04.csv", check.names = FALSE)
dp5.2021 = read.csv("ACS Data/2021/DP05.csv", check.names = FALSE)

#THIS FUNCTION CURRENTLY ONLY WORKS FOR ACS DATA AND IS DESIGNED ENTIRELY AROUND ITS STRUCUTRE
#DO NOT USE FOR ANYTHING ELSE
dataclean = function(dataset){
  dataset = dataset[-(seq(3,nrow(dataset),by = 3)),]
  dataset = dataset %>%
    mutate(Label..Grouping.=lag(Label..Grouping.))
  dataset = dataset[-(seq(1,nrow(dataset),by = 2)),]
  
  return(dataset)
}

#Uses the above function to merge all specified data sets into one after cleaning
#Also remove Puerto Rico
datamerge = function(dp2, dp3, dp4, dp5, end_name, year){
  dp2 = dataclean(dp2)
  dp3 = dataclean(dp3)
  dp4 = dataclean(dp4)
  dp5 = dataclean(dp5)
  dflist = list(dp2, dp3, dp4, dp5)
  end_name = Reduce(function(x,y) merge(x,y, all=TRUE), dflist)
  end_name = end_name[-40,]
  year = rep(year, nrow(end_name))
  region = rep(0, nrow(end_name))
  end_name = cbind(end_name, year, region)
  colnames(end_name)[1] = "state"

  #sadly every state needs to be done individually
  end_name = end_name %>%
    mutate(
      region = case_when(
        state == "Connecticut" | state == "Maine" | state == "Massachusetts" | state == "New Hampshire" |
        state == "New Jersey" | state == "New York" | state == "Pennsylvania" | state == "Rhode Island" |
        state == "Vermont" ~ 1,
        state == "Illinois" | state == "Indiana" | state == "Iowa" | state == "Kansas" | state == "Michigan" |
        state == "Minnesota" | state == "Missouri" | state == "Nebraska" | state == "North Dakota" |
        state == "Ohio" | state == "South Dakota" | state == "Wisconsin" ~ 2,
        state == "Alabama" | state == "Arkansas" | state == "Delaware" | state == "Florida" |
        state == "Georgia" | state == "Kentucky" | state == "Louisiana" | state == "Maryland" |
        state == "Mississippi" | state == "North Carolina" | state == "Oklahoma" | state == "South Carolina" |
        state == "Tennessee" | state == "Texas" | state == "Virginia" | state == "District of Columbia" |
        state == "West Virginia" ~ 3,
        state == "Alaska" | state == "Arizona" | state == "California" | state == "Colorado" |
        state == "Hawaii" | state == "Idaho" | state == "Montana" | state == "Nevada" |
        state == "New Mexico" | state == "Oregon" | state == "Utah" | state == "Washington" |
        state == "Wyoming" ~ 4
      )
    )
  return(end_name)
}

#Run the above scripts on all yearly data sets

dp.2010 = datamerge(dp2.2010, dp3.2010, dp3.2010, dp4.2010, dp.2010, 2010)
dp.2011 = datamerge(dp2.2011, dp3.2011, dp3.2011, dp4.2011, dp.2011, 2011)
dp.2012 = datamerge(dp2.2012, dp3.2012, dp3.2012, dp4.2012, dp.2012, 2012)
dp.2013 = datamerge(dp2.2013, dp3.2013, dp3.2013, dp4.2013, dp.2013, 2013)
dp.2014 = datamerge(dp2.2014, dp3.2014, dp3.2014, dp4.2014, dp.2014, 2014)
dp.2015 = datamerge(dp2.2015, dp3.2015, dp3.2015, dp4.2015, dp.2015, 2015)
dp.2016 = datamerge(dp2.2016, dp3.2016, dp3.2016, dp4.2016, dp.2016, 2016)
dp.2017 = datamerge(dp2.2017, dp3.2017, dp3.2017, dp4.2017, dp.2017, 2017)
dp.2018 = datamerge(dp2.2018, dp3.2018, dp3.2018, dp4.2018, dp.2018, 2018)
dp.2019 = datamerge(dp2.2019, dp3.2019, dp3.2019, dp4.2019, dp.2019, 2019)
dp.2021 = datamerge(dp2.2021, dp3.2021, dp3.2021, dp4.2021, dp.2021, 2021)


#Combine data sets

dp.compiled = rbind(dp.2010, dp.2011,dp.2012, dp.2013, dp.2014, dp.2015, dp.2016,
                    dp.2017,dp.2018, dp.2019, dp.2021)


#select needed information, names are unfortunately very long
#try just each age group, under 18 as kids, 18 to 62 as adult, 62+ as elder
dp.2021 = dp.2021[,c("state", 'year', 'region', 'SEX.AND.AGE..Total.population', 'SEX.AND.AGE..Total.population..Under.18.years',
                     'SEX.AND.AGE..Total.population..18.years.and.over', 'SEX.AND.AGE..Total.population..62.years.and.over',
                     'Total.housing.units', 'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'INCOME.AND.BENEFITS..IN.2021.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'HOUSEHOLDS.BY.TYPE..Total.households', 'HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.household',
                     'HOUSEHOLDS.BY.TYPE..Total.households..Cohabiting.couple.household',
                     'MARITAL.STATUS..Males.15.years.and.over', 'MARITAL.STATUS..Females.15.years.and.over',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                     'COMPUTERS.AND.INTERNET.USE..Total.households',
                     'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                     'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription')]

dp.2010 = dp.2010[,c("state", 'year', 'region', 'SEX.AND.AGE..Total.population', 'SEX.AND.AGE..Total.population..Under.18.years',
                     'SEX.AND.AGE..Total.population..18.years.and.over', 'SEX.AND.AGE..Total.population..62.years.and.over',
                     'Total.housing.units', 'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'INCOME.AND.BENEFITS..IN.2010.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'HOUSEHOLDS.BY.TYPE..Total.households', 'HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.household',
                     'HOUSEHOLDS.BY.TYPE..Total.households..Cohabiting.couple.household',
                     'MARITAL.STATUS..Males.15.years.and.over', 'MARITAL.STATUS..Females.15.years.and.over',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
                     'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
                     'COMPUTERS.AND.INTERNET.USE..Total.households',
                     'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
                     'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription')]

dp.2010[,'SEX.AND.AGE..Total.population']


dp.2019[,c("state", 'year', 'region', 
                     'ROOMS..Total.housing.units', 'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force',
                     'EMPLOYMENT.STATUS..Population.16.years.and.over..In.labor.force..Civilian.labor.force..Employed',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households..Less.than..10.000',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...10.000.to..14.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...15.000.to..24.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...25.000.to..34.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...35.000.to..49.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...50.000.to..74.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...75.000.to..99.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...100.000.to..149.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...150.000.to..199.999',
                     'INCOME.AND.BENEFITS..IN.2019.INFLATION.ADJUSTED.DOLLARS...Total.households...200.000.or.more',
                     'HOUSEHOLDS.BY.TYPE..Total.households', 'HOUSEHOLDS.BY.TYPE..Total.households..Married.couple.household',
                     'HOUSEHOLDS.BY.TYPE..Total.households..Cohabiting.couple.household',
                     'MARITAL.STATUS..Males.15.years.and.over', 'MARITAL.STATUS..Females.15.years.and.over')]


'SEX.AND.AGE..Total.population', 'SEX.AND.AGE..Total.population..Under.18.years',
'SEX.AND.AGE..Total.population..18.years.and.over', 'SEX.AND.AGE..Total.population..62.years.and.over',
#Useful Data
#Total Population so I can divide it up by age group. Sum by decade?
#Age Group Population
#I could  maybe include racial demographics but in current climate that seems dangerous
#Total.housing.units
#all aggregate employment status information
#Maybe class of worker instead?
#Income and benefits in each range might be absolutely huge
#Households by Type
#marital status
#educational attainemnet is maybe relevant
#length of residency. Places where new people flock to are likely to experience a surge in prices
#% with computers can maybe function as an instrument for tech level since it varies a lot by state?
#year and region obviously

'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Less.than.9th.grade',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..9th.to.12th.grade..no.diploma',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..High.school.graduate..includes.equivalency.',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Some.college..no.degree',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Associate.s.degree',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Bachelor.s.degree',
'EDUCATIONAL.ATTAINMENT..Population.25.years.and.over..Graduate.or.professional.degree',
'COMPUTERS.AND.INTERNET.USE..Total.households',
'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.computer',
'COMPUTERS.AND.INTERNET.USE..Total.households..With.a.broadband.Internet.subscription'