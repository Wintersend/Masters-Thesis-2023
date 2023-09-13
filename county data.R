#load in social, economic, housing, demographic, and mortgage characteristics for each year
#data is ostensibly subdivision level but is really county level

#Each year has different counties, making this panel data
#Need to figure out how to work with that effectively


dp2.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP02-Data.csv", skip = 1)
dp3.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP03-Data.csv", skip = 1)
dp4.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP04-Data.csv", skip = 1)
dp5.2010.c = read.csv("ACS Data/2010/ACSDP1Y2010.DP05-Data.csv", skip = 1)
GINI.2010.c = read.csv("ACS Data/2010/ACSDT1Y2010.GINI.csv", skip = 1)
st1.2010.c = read.csv("ACS Data/2010/ACSST1Y2010.S0101-Data.csv")

#2011 data excluded due to download issues

dp2.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP02-Data.csv", skip = 1)
dp3.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP03-Data.csv", skip = 1)
dp4.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP04-Data.csv", skip = 1)
dp5.2012.c = read.csv("ACS Data/2012/ACSDP1Y2012.DP05-Data.csv", skip = 1)
GINI.2012.c = read.csv("ACS Data/2012/ACSDT1Y2012.GINI.csv", skip = 1)
st1.2012.c = read.csv("ACS Data/2012/ACSDT1Y2012.B25101-2023-07-28T112752.csv")

dp2.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP02-Data.csv", skip = 1)
dp3.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP03-Data.csv", skip = 1)
dp4.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP04-Data.csv", skip = 1)
dp5.2013.c = read.csv("ACS Data/2013/ACSDP1Y2013.DP05-Data.csv", skip = 1)
GINI.2013.c = read.csv("ACS Data/2013/ACSDT1Y2013.GINI.csv", skip = 1)
st1.2013.c = read.csv("ACS Data/2013/ACSDT1Y2013.B25101-2023-07-28T112741.csv")

dp2.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP02-Data.csv", skip = 1)
dp3.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP03-Data.csv", skip = 1)
dp4.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP04-Data.csv", skip = 1)
dp5.2014.c = read.csv("ACS Data/2014/ACSDP1Y2014.DP05-Data.csv", skip = 1)
GINI.2014.c = read.csv("ACS Data/2014/ACSDT1Y2014.GINI.csv", skip = 1)
st1.2014.c = read.csv("ACS Data/2014/ACSDT1Y2014.B25101-2023-07-28T112731.csv")

dp2.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP02-Data.csv", skip = 1)
dp3.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP03-Data.csv", skip = 1)
dp4.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP04-Data.csv", skip = 1)
dp5.2015.c = read.csv("ACS Data/2015/ACSDP1Y2015.DP05-Data.csv", skip = 1)
GINI.2015.c = read.csv("ACS Data/2015/ACSDT1Y2015.GINI.csv", skip = 1)
st1.2015.c = read.csv("ACS Data/2015/ACSDT1Y2015.B25101-2023-07-28T112657.csv")

dp2.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP02-Data.csv", skip = 1)
dp3.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP03-Data.csv", skip = 1)
dp4.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP04-Data.csv", skip = 1)
dp5.2016.c = read.csv("ACS Data/2016/ACSDP1Y2016.DP05-Data.csv", skip = 1)
GINI.2016.c = read.csv("ACS Data/2016/ACSDT1Y2016.GINI.csv", skip = 1)
st1.2016.c = read.csv("ACS Data/2016/ACSDT1Y2016.B25101-2023-07-28T112629.csv")

dp2.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP02-Data.csv", skip = 1)
dp3.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP03-Data.csv", skip = 1)
dp4.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP04-Data.csv", skip = 1)
dp5.2017.c = read.csv("ACS Data/2017/ACSDP1Y2017.DP05-Data.csv", skip = 1)
GINI.2017.c = read.csv("ACS Data/2017/ACSDT1Y2017.GINI.csv", skip = 1)
st1.2017.c = read.csv("ACS Data/2017/ACSDT1Y2017.B25101-2023-07-28T112613.csv")

dp2.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP02-Data.csv", skip = 1)
dp3.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP03-Data.csv", skip = 1)
dp4.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP04-Data.csv", skip = 1)
dp5.2018.c = read.csv("ACS Data/2018/ACSDP1Y2018.DP05-Data.csv", skip = 1)
GINI.2018.c = read.csv("ACS Data/2018/ACSDT1Y2018.GINI.csv", skip = 1)
st1.2018.c = read.csv("ACS Data/2018/ACSDT1Y2018.B25101-2023-07-28T112556.csv")

dp2.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP02-Data.csv", skip = 1)
dp3.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP03-Data.csv", skip = 1)
dp4.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP04-Data.csv", skip = 1)
dp5.2019.c = read.csv("ACS Data/2019/ACSDP1Y2019.DP05-Data.csv", skip = 1)
GINI.2019.c = read.csv("ACS Data/2019/ACSDT1Y2019.GINI.csv", skip = 1)
st1.2019.c = read.csv("ACS Data/2019/ACSDT1Y2019.B25101-2023-07-28T112540.csv")

dp2.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP02-Data.csv", skip = 1)
dp3.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP03-Data.csv", skip = 1)
dp4.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP04-Data.csv", skip = 1)
dp5.2021.c = read.csv("ACS Data/2021/ACSDP1Y2021.DP05-Data.csv", skip = 1)
GINI.2021.c = read.csv("ACS Data/2021/ACSDT1Y2021.GINI.csv", skip = 1)
st1.2021.c = read.csv("ACS Data/2021/ACSDT1Y2021.B25101-2023-07-28T112524.csv")


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
  
  if(zero_checker("poverty", dataset)){
    dataset = dataset[,-(grep("poverty", colnames(dataset), ignore.case = TRUE))]}
  
  #Below this point may be used again but isn't neccesary right now
  if(zero_checker("rooms", dataset)){
    dataset = dataset[,-(grep("rooms", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("built", dataset)){
    dataset = dataset[,-(grep("built", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("grandparents", dataset)){
    dataset = dataset[,-(grep("grandparents", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("school.enrollment", dataset)){
    dataset = dataset[,-(grep("school.enrollment", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("year.of.entry", dataset)){
    dataset = dataset[,-(grep("year.of.entry", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("veteran", dataset)){
    dataset = dataset[,-(grep("veteran", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("disability", dataset)){
    dataset = dataset[,-(grep("disability", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("commuting", dataset)){
    dataset = dataset[,-(grep("commuting", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("industry", dataset)){
    dataset = dataset[,-(grep("industry", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("heating", dataset)){
    dataset = dataset[,-(grep("heating", colnames(dataset), ignore.case = TRUE))]}
  
  if(zero_checker("selected.characteristics", dataset)){
    dataset = dataset[,-(grep("selected.characteristics", colnames(dataset), ignore.case = TRUE))]}
  
  return(dataset)
}

#Uses the above function to merge all specified data sets into one after cleaning
#Also remove Puerto Rico
datamerge = function(dp2, dp3, dp4, dp5, GINI, end_name, year){
  dp2 = dataclean(dp2)
  dp3 = dataclean(dp3)
  dp4 = dataclean(dp4)
  dp5 = dataclean(dp5)
  dflist = list(dp2, dp3, dp4, dp5, GINI)
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


#Get cleaned data for each year
cleaned2010 = datamerge(dp2.2010.c, dp3.2010.c, dp4.2010.c, dp5.2010.c, GINI.2010.c, cleaned2010, 2010)
cleaned2012 = datamerge(dp2.2012.c, dp3.2012.c, dp4.2012.c, dp5.2012.c, GINI.2012.c, cleaned2012, 2012)
cleaned2013 = datamerge(dp2.2013.c, dp3.2013.c, dp4.2013.c, dp5.2013.c, GINI.2013.c, cleaned2013, 2013)
cleaned2014 = datamerge(dp2.2014.c, dp3.2014.c, dp4.2014.c, dp5.2014.c, GINI.2014.c, cleaned2014, 2014)
cleaned2015 = datamerge(dp2.2015.c, dp3.2015.c, dp4.2015.c, dp5.2015.c, GINI.2015.c, cleaned2015, 2015)
cleaned2016 = datamerge(dp2.2016.c, dp3.2016.c, dp4.2016.c, dp5.2016.c, GINI.2016.c, cleaned2016, 2016)
cleaned2017 = datamerge(dp2.2017.c, dp3.2017.c, dp4.2017.c, dp5.2017.c, GINI.2017.c, cleaned2017, 2017)
cleaned2018 = datamerge(dp2.2018.c, dp3.2018.c, dp4.2018.c, dp5.2018.c, GINI.2018.c, cleaned2018, 2018)
cleaned2019 = datamerge(dp2.2019.c, dp3.2019.c, dp4.2019.c, dp5.2019.c, GINI.2019.c, cleaned2019, 2019)
cleaned2021 = datamerge(dp2.2021.c, dp3.2021.c, dp4.2021.c, dp5.2021.c, GINI.2021.c, cleaned2021, 2021)


#ST1 data is laid out differently and needs a separate data clean step

#create a set without percents
#very short but I might incorporate it into a longer function elsewhere
percent_out = function(dataset){
  dataset = dataset[,-(grep("percent", colnames(dataset), ignore.case = TRUE))]
}

cleaned10.a = percent_out(cleaned2010)
cleaned12.a = percent_out(cleaned2012)
cleaned13.a = percent_out(cleaned2013)
cleaned14.a = percent_out(cleaned2014)
cleaned15.a = percent_out(cleaned2015)
cleaned16.a = percent_out(cleaned2016)
cleaned17.a = percent_out(cleaned2017)
cleaned18.a = percent_out(cleaned2018)
cleaned19.a = percent_out(cleaned2019)
cleaned21.a = percent_out(cleaned2021)


#------------------------
#Extract targeted data to merge
#------------------------

#2010 data lacks population characteristics
#lacks cohabitating households


#isolate above 18 population statistics

dp.2010 = cleaned10.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                     'Estimate..Gini.Index')]




dp.2012 = cleaned12.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                     'Estimate..Gini.Index')]


dp.2013 = cleaned13.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                    'Estimate..Gini.Index')]


dp.2014 = cleaned14.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                     'Estimate..Gini.Index')]

#input 15,16,17,18

dp.2015 = cleaned15.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                     'Estimate..Gini.Index')]


dp.2016 = cleaned16.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                        'Estimate..Gini.Index')]

dp.2017 = cleaned17.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                        'Estimate..Gini.Index')]

dp.2018 = cleaned18.a[,c("state", 'Geographic.Area.Name', 'year', 'region',
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
                      'Estimate..Gini.Index')]

dp.2019 = cleaned19.a[,c("state", 'Geographic.Area.Name', 'year', 'region', 
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
        'Estimate..Gini.Index')]



dp.2021 = cleaned21.a[,c("state", 'Geographic.Area.Name' ,'year', 'region', 
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
                    'Estimate..Gini.Index')]
#-----------------------------------
#Ready for merging
#-----------------------------------

#First step, reanme for rapid identification of shared columns with different names
#I will need to double check columns are all the same throughout, but this is a quick way if so

name_align = function(df, new_name){
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
           over.18.pop = 34
           )
  #commented out, cuts all non-country observations
  new_name = subset(new_name[-(1:53),])
  return(new_name)
}

merge10 = name_align(dp.2010, merge10)
merge12 = name_align(dp.2012, merge12)
merge13 = name_align(dp.2013, merge13)
merge14 = name_align(dp.2014, merge14)
merge15 = name_align(dp.2015, merge15)
merge16 = name_align(dp.2016, merge16)
merge17 = name_align(dp.2017, merge17)
merge18 = name_align(dp.2018, merge18)
merge19 = name_align(dp.2019, merge19)
merge21 = name_align(dp.2021, merge21)

mergedf = rbind(merge10, merge12, merge13, merge14, merge15, merge16, merge17, merge18, merge19, merge21)

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
           GINI = 36
    )
  #commented out, cuts all non-country observations
  new_name = subset(new_name[(2:53),])
  return(new_name)
}

merge10s = name_align.s(dp.2010, merge10s)
merge12s = name_align.s(dp.2012, merge12)
merge13s = name_align.s(dp.2013, merge13)
merge14s = name_align.s(dp.2014, merge14)
merge15s = name_align.s(dp.2015, merge15)
merge16s = name_align.s(dp.2016, merge16)
merge17s = name_align.s(dp.2017, merge17)
merge18s = name_align.s(dp.2018, merge18)
merge19s = name_align.s(dp.2019, merge19)
merge21s = name_align.s(dp.2021, merge21)

mergedf.s = rbind(merge10s, merge12s, merge13s, merge14s, merge15s, merge16s, merge17s, merge18s, merge19s, merge21s)


#---------------------------
#EXPERIMENTAL CODE
#---------------------------
test = dp5.2021.c[,-(grep("Margin.of.Error", colnames(dp5.2021.c), ignore.case = TRUE))]
test = test[,-(grep("Annotation", colnames(test), ignore.case = TRUE))]
test = test[,-(grep("race", colnames(test), ignore.case = TRUE))]

#repeat for dp2 through 4 to check if any other categories need removal
test2 = dp2.2021.c[,-(grep("Margin.of.Error", colnames(dp2.2021.c), ignore.case = TRUE))]
test2 = test2[,-(grep("Annotation", colnames(test2), ignore.case = TRUE))]
test2 = test2[,-(grep("fertility", colnames(test2), ignore.case = TRUE))]
test2 = test2[,-(grep("place.of.birth", colnames(test2), ignore.case = TRUE))]
test2 = test2[,-(grep("foreign.born", colnames(test2), ignore.case = TRUE))]
test2 = test2[,-(grep("language", colnames(test2), ignore.case = TRUE))]
test2 = test2[,-(grep("ancestry", colnames(test2), ignore.case = TRUE))]


test3 = dp3.2021.c[,-(grep("Margin.of.Error", colnames(dp3.2021.c), ignore.case = TRUE))]
test3 = test3[,-(grep("Annotation", colnames(test3), ignore.case = TRUE))]
test3 = test3[,-(grep("health.insurance", colnames(test3), ignore.case = TRUE))]
test3 = test3[,-(grep("poverty", colnames(test3), ignore.case = TRUE))]

test4 = dp4.2021.c[,-(grep("Margin.of.Error", colnames(dp4.2021.c), ignore.case = TRUE))]
test4 = test4[,-(grep("Annotation", colnames(test4), ignore.case = TRUE))]
test4 = test4[,-(grep("race", colnames(test4), ignore.case = TRUE))]

#zero_checker tests to see if the following will return 0s
zero_checker = function(dataset){
!is.integer(grep("race", colnames(dataset), ignore.case = TRUE)) && length(grep("race", colnames(dataset), ignore.case = TRUE)) == 0L
}

is.null(grep("race", colnames(test2), ignore.case = TRUE))
        
#---------------------------
#Create more new parameters
#---------------------------
#control to be in proportions
#normalize on Population
#lagged income
#educ
#plot out inequality
#create working population 18-65 population
#use over 65 pop maybe
mergedf.s.did = mergedf.s.did %>% 
  mutate(inc.pop = total.income.benefits/employable.pop)