library(dplyr)

read.csv("data/mieszkania_wroclaw_ceny.csv") -> mieszkania

mutate(mieszkania, cena=cena_m2*metraz) %>%
  mutate(kat_cenowa=case_when(
    cena_m2 <5300 ~ "1. bardzo tanie",
    cena_m2 >=5300 & cena_m2 < 5800 ~ "2. tanie",
    cena_m2 >=5800 & cena_m2 <6650 ~ "3. drogie",
    cena_m2 >=6650 ~ "4. bardzo drogie"
  )) %>%
  mutate(kat_cenowa = ordered(kat_cenowa))-> mieszkania

write.csv(mieszkania, file = "data/mieszkania_wroclaw_ceny_rozbudowana.csv")