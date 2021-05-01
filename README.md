Analiza danych Airbnb NYC 2019
Kasper Żdaniec
15.06.2020
Celem analizy jest sprawdzenie jak duży wpływ wywiera dzielnica na pozostałe czynniki takie jak cena pokoju, liczba recenzji, dostepność pokoju w ciagu 365dni. Dane zostały zebrane i uśrednione na przestrzeni lat 2008-2019. Związane są z wynajmowaniem apartamentów znajdujących sie w Nowym Jorku.

Baza danych firmy Airbnb łączy osoby szukające zakwaterowania (goście Airbnb) z osobami, które chcą wynająć swoje nieruchomości (gospodarze Airbnb) w perspektywie krótko lub długoterminowej. Od 2008 roku wielu gości i gospodarzy korzystało z Airbnb w celu rozszerzenia możliwości podróżowania i zapewniło spersonalizowany i wygodny sposób na poznanie świata.

Dane zostały pobrane ze strony: https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data

![image](https://user-images.githubusercontent.com/79860696/116782175-edb06780-aa87-11eb-874f-718207c4da15.png)

![image](https://user-images.githubusercontent.com/79860696/116782066-52b78d80-aa87-11eb-9c2e-e2b86a160ac7.png)

![image](https://user-images.githubusercontent.com/79860696/116782071-58ad6e80-aa87-11eb-8451-5bda76a8ef4b.png)

W dalszej częsci korzystam z testu t-studenta i testu Wilcoxon, a następnie stawiam hipotezy. Dla naszych badań przyjmujemy poziom istotności alfa=0,05:

![image](https://user-images.githubusercontent.com/79860696/116782075-619e4000-aa87-11eb-869d-daacc80e64b8.png)

![image](https://user-images.githubusercontent.com/79860696/116782082-737fe300-aa87-11eb-82eb-53eeddcddafa.png)

![image](https://user-images.githubusercontent.com/79860696/116782089-78449700-aa87-11eb-9e68-343991f07c7d.png)

![image](https://user-images.githubusercontent.com/79860696/116782094-7da1e180-aa87-11eb-8fc9-cba302abc8fb.png)

Dla każdej dzielnicy zostały policzone średnie dotyczące: ceny wynajmu pokoju, liczba recenzji, dostępność pokoju w ciągu roku. Dane które zostały pobrane zostały wcześniej uśrednione dla poszczególnych lat przez firme, więc okres badany możemy rozpocząc od 2008 roku.
Zrealizujmy przykładową interpretacje danych dla dzielnicy Bronx. Średnia cena wynajmu pokoju w dzielnicy Bronx wynosi 87,5$, a liczba recenzji dla tej dzielnicy wynosi średnio 26, zaś pokój do wynajęcia średnio jest dostępny 165,7 dnia w roku.

WNIOSKI:

Po postawieniu trzeciego pytania “Czy dzielnica wpływa na dostępność” i postawieniu H0 i H1 można wywnioskować, że dane wybrane do analizy nie były dobrze dobrane.

Dziekuję za uwagę.
