Wizualizacja danych za pomocą pakietu ggplot
========================================================
author: Bartosz Kolasa
date: 07-11-2017
autosize: true
font-family: 'Helvetica'


Materiały
========================================================

Data Visualisation cheatsheet

<https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf>

Pakiety:
- ggplot2
- dplyr


Gramatyka wykresów
==============================
<img src="img/grammtics.png" width="250%"/>

Gramatyka wykresów
==============================

```r
library(ggplot2)
ggplot(mpg, aes(hwy, cty)) +
  geom_point(aes(color=cyl)) + geom_smooth(method="lm") +
  coord_cartesian() + scale_color_gradient() + theme_bw()
```

<img src="eRementarz2-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />


Najprostszy przykład
========================================================

```r
library(ggplot2)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=dzielnica)) + geom_bar()
```

<img src="eRementarz2-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />


Zmienna ciągła
======================================================


```r
library(ggplot2)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=metraz)) + geom_histogram()
```

<img src="eRementarz2-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />


Ograniczenie danych
===================================================


```r
library(dplyr)
filter(mieszkania, metraz<150) -> mieszkania
ggplot(mieszkania, aes(x=metraz)) + geom_histogram()
```

<img src="eRementarz2-figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

Kolejny wymiar
===================================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=dzielnica, fill=as.factor(n_pokoj))) + geom_bar()
```

<img src="eRementarz2-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

Rozsądniejsze kolory
=================================================

```r
library(RColorBrewer)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=dzielnica, fill=as.factor(n_pokoj))) + geom_bar() + scale_fill_brewer(palette="Reds") 
```

<img src="eRementarz2-figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

Porównywanie wartości
=================================================

```r
library(RColorBrewer)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=dzielnica, fill=as.factor(n_pokoj))) + geom_bar(position="fill") + scale_fill_brewer(name="Liczba pokoi", palette="Reds")
```

<img src="eRementarz2-figure/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />


Etykietki
==============================================

```r
library(RColorBrewer)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
ggplot(mieszkania, aes(x=dzielnica, fill=as.factor(n_pokoj))) + geom_bar(position="fill") +
  scale_fill_brewer(name="Liczba pokoi", palette="Reds") + geom_text(aes(label=..count..), stat="count", position="fill", vjust="bottom")
```

<img src="eRementarz2-figure/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />

Ostatnie szlify
==============================================

```r
library(RColorBrewer)
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny.csv")
mutate(mieszkania, n_pokoj=if_else(n_pokoj>4, "więcej niż 4", as.character(n_pokoj))) -> mieszkania
ggplot(mieszkania, aes(x=dzielnica, fill=as.factor(n_pokoj))) + geom_bar(position="fill") +
  scale_fill_brewer(name="Liczba pokoi", palette="Reds") + geom_text(aes(label=..count..), stat="count", position="fill", vjust="bottom")
```

<img src="eRementarz2-figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />

Zadania
===========================================
Do użycia nowy zbiór z pliku "data/mieszkania_wroclaw_ceny_rozbudowana.csv"
- Narysuj wykres słupkowy liczby mieszkań w wybranych kategoriach cenowych.
- Zbadaj jak rozkłada się to w zależności od dzielnic.
- Zbadaj odwrotną relację tzn. liczbę mieszkań w określonych kategoriach cenowych w wybranych dzielnicach

Rozkład kategorii cenowych
==============================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=kat_cenowa)) + geom_bar() 
```

<img src="eRementarz2-figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />

Rozkład kategorii cenowych wg dzielnic
==============================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=kat_cenowa, fill=dzielnica)) +  geom_bar(position="fill") 
```

<img src="eRementarz2-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" style="display: block; margin: auto;" />


Rozkład dzielnic wg kategorii
==============================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=dzielnica, fill=kat_cenowa)) +  geom_bar(position="fill") 
```

<img src="eRementarz2-figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

Dwa wymiary
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=dzielnica, y=cena)) +  geom_boxplot() 
```

<img src="eRementarz2-figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />

Skala logarytmiczna
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=dzielnica, y=cena)) +  geom_boxplot()+ scale_y_log10()
```

<img src="eRementarz2-figure/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" style="display: block; margin: auto;" />

Z etykietką
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=dzielnica, y=cena)) + geom_boxplot(stat="boxplot") +scale_y_log10() +
  geom_text(data=aggregate(cena ~ dzielnica,mieszkania, median), aes(label=cena, x=dzielnica, y=cena), vjust=-0.75)
```

<img src="eRementarz2-figure/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" style="display: block; margin: auto;" />


Bez outlierów
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
filter(mieszkania, cena < 1000000) -> mieszkania
ggplot(mieszkania, aes(x=dzielnica, y=cena)) + geom_boxplot(stat="boxplot") +scale_y_log10() +
  geom_text(data=aggregate(cena ~ dzielnica,mieszkania, median), aes(label=cena, x=dzielnica, y=cena), vjust=-0.75)
```

<img src="eRementarz2-figure/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" style="display: block; margin: auto;" />

Bez outlierów
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=dzielnica, y=cena)) + geom_boxplot(stat="boxplot") +scale_y_log10() +
  geom_text(data=aggregate(cena ~ dzielnica,mieszkania, median), aes(label=cena, x=dzielnica, y=cena), vjust=-0.75) + ylim(1e5, 1e6)
```

<img src="eRementarz2-figure/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" style="display: block; margin: auto;" />



Wykres punktowy
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=metraz, y=cena_m2)) + geom_point() +facet_wrap(~dzielnica)
```

<img src="eRementarz2-figure/unnamed-chunk-18-1.png" title="plot of chunk unnamed-chunk-18" alt="plot of chunk unnamed-chunk-18" style="display: block; margin: auto;" />


Wykres z rozrzutem
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=metraz, y=cena_m2)) + geom_jitter(size=0.1) +facet_wrap(~dzielnica) 
```

<img src="eRementarz2-figure/unnamed-chunk-19-1.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" style="display: block; margin: auto;" />

Wykres z pomocnikiem...
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
ggplot(mieszkania, aes(x=metraz, y=cena_m2)) + geom_jitter(size=0.1) + geom_smooth(method="loess") + facet_wrap(~dzielnica) 
```

<img src="eRementarz2-figure/unnamed-chunk-20-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" style="display: block; margin: auto;" />


... i poprawioną skalą
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
filter(mieszkania, metraz<150) -> mieszkania
ggplot(mieszkania, aes(x=metraz, y=cena_m2)) + geom_jitter(size=0.1) + geom_smooth(method="loess") + facet_wrap(~dzielnica)
```

<img src="eRementarz2-figure/unnamed-chunk-21-1.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" style="display: block; margin: auto;" />

... i bez Starego Miasta
===========================================

```r
mieszkania <- read.csv("data/mieszkania_wroclaw_ceny_rozbudowana.csv")
filter(mieszkania, metraz<150, dzielnica != "Stare Miasto") -> mieszkania
ggplot(mieszkania, aes(x=metraz, y=cena_m2)) + geom_jitter(size=0.1) + geom_smooth(method="loess") + facet_wrap(~dzielnica)
```

<img src="eRementarz2-figure/unnamed-chunk-22-1.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" style="display: block; margin: auto;" />
