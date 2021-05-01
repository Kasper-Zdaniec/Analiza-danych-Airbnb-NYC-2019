Analiza danych Airbnb NYC 2019
Kasper Żdaniec
15.06.2020
Celem analizy jest sprawdzenie jak duży wpływ wywiera dzielnica na pozostałe czynniki takie ja:k cena pokoju, liczba recenzji, dostepność pokoju w ciagu 365dni. Dane zostały zebrane i uśrednione na przestrzenilat 2008-2019. Związane są z wynajmowaniem apartamentów znajdujących sie w Nowym Jorku.

Baza danych firmy Airbnb łączy osoby szukające zakwaterowania (goście Airbnb) z osobami, które chcą wynająć swoje nieruchomości (gospodarze Airbnb) w perspektywie krótko lub długoterminowej. Od 2008 roku wielu gości i gospodarzy korzystało z Airbnb w celu rozszerzenia możliwości podróżowania i zapewniło spersonalizowany i wygodny sposób na poznanie świata.

Dane zostały pobrane ze strony: https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data

#Czyszczenie środowiska.
rm(list=ls())
#Ładuję dane dotyczące wynajmowanych apartamentów w Nowym Jorku.
wynajmowanie_apartamentow_w_nowym_jorku <- read.csv('C:/Users/Admin/Downloads/Programowanie-Projekty/RStudio/Laboratorium-Zdalnie-Projekt/80997_Żdaniec_Dane.csv')
#Przypisuję i dzielę dane na dwie grupy dotyczące wynajmowanych apartamentów w dwóch dzielnicach.
bronx_brooklyn <- wynajmowanie_apartamentow_w_nowym_jorku[wynajmowanie_apartamentow_w_nowym_jorku$neighbourhood_group %in% c('Bronx','Brooklyn'),]
bronx_queens <- wynajmowanie_apartamentow_w_nowym_jorku[wynajmowanie_apartamentow_w_nowym_jorku$neighbourhood_group %in% c('Bronx','Queens'),]
W dalszej częsci korzystam z testu t-studenta i testu Wilcoxon i w dalszej częsci stawiam hipotezy. Dla naszych badań przyjmujemy poziom istotności alfa=0,05:

#Chcę zbadać czy cena pokoju zależy od dzielnicy. 
# hipoteza zerowa: "Dzielnica nie wpływa na cenę".
# hipoteza alternatywna: "Dzielnica wpływa na cenę"

t.test(bronx_brooklyn$price ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$price ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa, zatem przyjmujemy hipoteze alternatywą.

t.test(bronx_queens$price  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$price  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa, zatem przyjmujemy hipotezę alternatywną.

#Możemy wywnioskować po zastosowaniu dwóch testóW, że dana dzielnica skorelowana z bronx ma wpływ na cene pokoju. 
#Chcę zbadać czy ilość wystawianych recenzji zależy od dzielnicy.
#H0:"Dzielnica wpływa na ilość recenzji."
#H1: "Dzielnica nie wpływa na ilość recenzji".

t.test(bronx_brooklyn$number_of_reviews  ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$number_of_reviews  ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

t.test(bronx_queens$number_of_reviews  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$availability_365  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

#Wniosek po wykonaniu dwóch testów jest taki, że dzielnica skorelowana z bronx nie wpływa na ilość recenzji.
#H0:Dzielnica wpływa na dostępność.
#H1: "Dzielnica nie wpływa na dostępność".  

t.test(bronx_brooklyn$availability_365  ~ bronx_brooklyn$neighbourhood_group)
wilcox.test(bronx_brooklyn$availability_365  ~ bronx_brooklyn$neighbourhood_group)
#Hipoteza zerowa odrzucona, ponieważ p-value jest mniejsze niż alfa, zatem występuję hipoteza alternatywna.

t.test(bronx_queens$availability_365  ~ bronx_queens$neighbourhood_group)
wilcox.test(bronx_queens$number_of_reviews  ~ bronx_queens$neighbourhood_group)
#Hipoteza zerowa przyjęta, ponieważ p-value jest większe niż alfa.

#W tym przypadku mamy dwie różne występujące hipotezy wyselekcjonowanych danych, co w szerszym rozumieniu nie jest miarodajne. Pierwszy przypadek mówi nam, że dzielnica nie wpływa na dostępność, a drugi,że jednak ma. W pobranej bazie danych te dzielnice były ze sobą skontrastowane. W dalszych badaniach należy postawić sobie pytanie czy wybrane dane mają sens statystyczny.
#Korzystając z poniższych poleceń można przejrzeć średnie wartości dla wszystkich dzielnic:

tapply(wynajmowanie_apartamentow_w_nowym_jorku$price, wynajmowanie_apartamentow_w_nowym_jorku$neighbourhood_group, mean)
tapply(wynajmowanie_apartamentow_w_nowym_jorku$number_of_reviews, wynajmowanie_apartamentow_w_nowym_jorku$neighbourhood_group, mean)
tapply(wynajmowanie_apartamentow_w_nowym_jorku$availability_365, wynajmowanie_apartamentow_w_nowym_jorku$neighbourhood_group, mean)
Dla każdej dzielnicy zostały policzone średnie dotyczące: ceny wynajmu pokoju, liczba recenzji, dostępność pokoju w ciągu roku. Dane które zostały pobrane zostały wcześniej uśrednione dla poszczególnych lat przez firme, więc okres badany możemy rozpocząc od 2008 roku.
Zrealizujmy przykładową interpretacje danych dla dzielnicy Bronx. Średnia cena wynajmu pokoju w dzielnicy Bronx wynosi 87,5$, a liczba recenzji dla tej dzielnicy wynosi średnio 26, zaś pokój do wynajęcia średnio jest dostępny 165,7 dnia w roku.

WNIOSKI:

Po postawieniu trzeciego pytania “Czy dzielnica wpływa na dostępność” i postawieniu H0 i H1 można wywnioskować, że dane wybrane do analizy nie były dobrze dobrane.

Dziekuję za uwagę.
