#install.packages('tidyverse')
library(tidyverse) #cmd + enter
install.packages('nycflights13')
library(nycflights13)
View(flights)

alaska_flights <- flights %>% 
  filter(carrier == "AS")

head(alaska_flights)
tail(alaska_flights)
glimpse(alaska_flights)

ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_point(alpha = 0.2)

ggplot(data = alaska_flights, mapping = aes(x = distance, y = air_time)) +
  geom_point(alpha = 0.2)

ggplot(data = alaska_flights, mapping = aes(x = sched_dep_time, y = dep_time)) +
  geom_point(alpha = 0.2)

ggplot(data = alaska_flights, mapping = aes(x = dep_time, y = dep_delay)) +
  geom_point(alpha = 0.2)

#Create a new scatterplot using different variables in the `alaska_flights`
#data frame by modifying the example above.

ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_jitter(width = 60, height = 40)

View(weather)

early_january_weather <- weather %>% 
  filter(origin == "EWR" & month == 1 & day <= 15)

ggplot(data = early_january_weather, mapping = aes(x = time_hour, y = temp)) +
  geom_line()

#Plot a time series of a variable other than temp for Newark Airport in the 
# first 15 days of January 2013.
ggplot(data = early_january_weather, mapping = aes(x = time_hour, y = humid)) +
  geom_line()
ggplot(weather, aes(x = temp)) +
  geom_histogram()

ggplot(weather, aes(x = temp)) +
  geom_histogram(binw =30, color = 'white', fill = 'steelblue')

ggplot(weather, aes(x = temp)) +
  geom_histogram(binw =60, color = 'white', fill = 'steelblue')

myplot <- ggplot(weather, aes(x = temp)) +
  geom_histogram(binwidth = 5, color = "white") +
  facet_wrap(~ month, nrow=3)
1 + 100

3 + 5 * 2
(3 + 5) * 2
2/10000
sin(1)
log(1)
1 == 1 
1 != 2
1 < 2
x <- 1/40
x
periods.between.words 
underscores_between_words 
camelCaseToSeparateWords 

1:5
2^(1:5)
x <- 1:5
2^x
ls()
rm(x)
ls()
rm(list = ls())
x <- 1/40
alaska_flights$dep_delay
typeof(alaska_flights$carrier)
typeof(3.14)

portland_flight <- flights %>% 
  filter(dest == "PDX")
#To see many of these in action, let’s select all flights that left
#JFK airport heading to Burlington, Vermont ("BTV") or Seattle, 
#Washington ("SEA") in the months of October, November, or December. 

btv_sea_flights_fall <- flights %>% 
  filter(origin == "JFK", dest == "BTV" | dest == "SEA", 
         month >= 10)

not_btv_sea_flights_fall2 <- flights %>% 
  filter(!(dest == "BTV" | dest = "SEA"))

many_airports <- flights %>% 
  filter(dest == "BTV" | dest == "SEA" | dest == "PDX" | dest == "SFO" | dest == "BDL")

many_airports <- flights %>% 
  filter(dest %in% c("BTV", "SEA", "PDX", "SFO", "BDL"))
summary_temp <- weather %>% 
  summarize(mean = mean(temp, na.rm = TRUE),
            std_dev = sd(temp, na.rm = TRUE))
summary_temp

summary_monthly_temp <- weather %>% 
  group_by(month) %>% 
  summarise(mean = mean(temp, na.rm = T),
            std_dev = sd(temp, na.rm = T))

by_origin_monthly <- flights %>% 
  group_by(origin, month)  %>% 
  summarise(count = n())

flights <- flights %>% 
  mutate(gain = dep_delay - arr_delay)
