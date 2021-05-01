#Ładuję dane dotyczące wynajmowanych apartamentów w Nowym Jorku pobrane z: https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data

airbnb <- read.csv('C:/Users/Admin/Downloads/Programowanie-Projekty/RStudio/Laboratorium-Zdalnie-Projekt/AB_NYC_2019.csv')

#Przypisuję i dzielę dane na dwie w grupy dotyczące wynajmowanych apartamentów w dwóch dzielnicach.

bronx_brooklyn <- airbnb[airbnb$neighbourhood_group %in% c('Bronx','Brooklyn'),]
bronx_queens <- airbnb[airbnb$neighbourhood_group %in% c('Bronx','Queens'),]

#Chcę zbadać czy cena pokoju zależy od dzielnicy. 
#Pierwsza hipoteza zerowa to: "Dzielnica nie wpływa na cenę".

t.test(bronx_brooklyn$price ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$price ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa.

t.test(bronx_queens$price  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$price  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa.

#Chcę zbadać czy ilość wystawianych recenzji zależy od dzielnicy. 
#Drugga hipoteza zerowa to: "Dzielnica nie wpływa na ilość recenzji".

t.test(bronx_brooklyn$number_of_reviews  ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$number_of_reviews  ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

t.test(bronx_queens$number_of_reviews  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$availability_365  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

#Chcemy zbadać, czy dostępność oferty zależy od dzielnicy. 
#Trzecia hipoteza zerowa to: "Dzielnica nie wpływa na dostępność".

t.test(bronx_brooklyn$availability_365  ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$availability_365  ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa.

t.test(bronx_queens$availability_365  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$number_of_reviews  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

#Średnie wartości tablic:
tapply(airbnb$price, airbnb$neighbourhood_group, mean)
tapply(airbnb$number_of_reviews, airbnb$neighbourhood_group, mean)
tapply(airbnb$availability_365, airbnb$neighbourhood_group, mean)

#Wnioski:
#Hipoteza pierwsza wykazuję, że dzielnica ma wpływ na cenę wynajmu.
#Hipoteza druga wykazuję, że dzielnica nie wpływa na ilość recenzji
#Hipoteza trzecia wykazuję, że w zestawieniu bronx_brooklyn dzielnica wpływa na dostępność ofert, a w zestawieniu bronx_queens nie wpływa.
