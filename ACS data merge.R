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
#DP02

dp2 = read.csv("ACS Data/2010/DP02.csv")
dp3 = read.csv("ACS Data/2010/DP03.csv")
dp4 = read.csv("ACS Data/2010/DP04.csv")
dp5 = read.csv("ACS Data/2010/DP05.csv")


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
      state == "Illinois" | state == "Indiana" | state == "Iowa" | state == "Kanas" | state == "Michigan" |
      state == "Minnesota" | state == "Missouri" | state == "Nebraska" | state == "North Dakota" |
      state == "Ohio" | state == "South Dakota" | state == "Wisconsin" ~ 2,
      state == "Alabama" | state == "Arkansis" | state == "Delaware" | state == "Florida" |
      state == "Georgia" | state == "Kentucky" | state == "Lousiana" | state == "Maryland" |
      state == "Mississippi" | state == "North Carolina" | state == "Oklahoma" | state == "South Carolina" |
      state == "Tennessee" | state == "Texas" | state == "Virginia" | state == "District of Columbia" |
      state == "West Virginia" ~ 3,
      state == "Alaska" | state == "Arizona" | state == "California" | state == "Colorado" |
      state == "Hawaii" | state == "Idaho" | sate == "Montana" | state == "Nevada" |
      state == "Nem MExico" | state == "Oregon" | state == "Utah" | state == "Washington" |
      state == "Wyoming" ~ 4
    )
  )
return(end_name)
}

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


acs2010 = datamerge(dp2, dp3, dp4, dp5, acs2010)
yearvar = rep(2010, nrow(acs2010))
acs2010 = cbind(acs2010,yearvar)
