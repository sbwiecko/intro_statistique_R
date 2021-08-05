
# Satisfaction à l'hôpital (1/3)

Ce devoir porte sur une étude évaluant la qualité de relation et la quantité d’information reçue par des patients lors d'un séjour à l’hôpital. 534 patients ont été recrutés sur plusieurs hôpitaux de la région parisienne.


```R
# les fichiers ont été téléchargés dans ../data/
data <- read.csv2('../data/satisfaction_hopital.csv')
```

##### Pour les trois variables catégorielles du fichier (à vous de déterminer de quelles variables il s'agit), présentez les pourcentages de sujets relevant de chacune des modalités.


```R
str(data)
```

    'data.frame':	534 obs. of  9 variables:
     $ service           : int  3 3 3 3 3 3 3 3 3 3 ...
     $ sexe              : int  0 1 1 0 1 0 0 0 0 1 ...
     $ age               : int  41 29 83 66 84 84 60 85 28 35 ...
     $ profession        : int  4 8 2 3 NA 6 3 3 3 3 ...
     $ amelioration.sante: int  1 2 2 2 NA 3 2 3 3 3 ...
     $ amelioration.moral: int  0 3 1 0 NA 3 1 1 1 2 ...
     $ recommander       : int  1 2 2 2 NA 2 1 2 1 NA ...
     $ score.relation    : int  36 33 40 32 NA 39 31 NA 36 NA ...
     $ score.information : int  22 36 37 35 NA 28 30 NA 29 NA ...
    


```R
summary(data)
```


        service           sexe             age          profession   
     Min.   :1.000   Min.   :0.0000   Min.   :18.00   Min.   :1.000  
     1st Qu.:3.000   1st Qu.:0.0000   1st Qu.:45.00   1st Qu.:3.000  
     Median :5.000   Median :0.0000   Median :60.00   Median :4.000  
     Mean   :4.549   Mean   :0.4981   Mean   :58.21   Mean   :4.431  
     3rd Qu.:7.000   3rd Qu.:1.0000   3rd Qu.:72.00   3rd Qu.:5.500  
     Max.   :8.000   Max.   :1.0000   Max.   :97.00   Max.   :8.000  
                                      NA's   :6       NA's   :107    
     amelioration.sante amelioration.moral  recommander    score.relation 
     Min.   :0.000      Min.   :0.000      Min.   :0.000   Min.   :13.00  
     1st Qu.:2.000      1st Qu.:1.000      1st Qu.:1.000   1st Qu.:33.00  
     Median :2.000      Median :1.000      Median :2.000   Median :36.00  
     Mean   :2.231      Mean   :1.679      Mean   :1.625   Mean   :35.22  
     3rd Qu.:3.000      3rd Qu.:3.000      3rd Qu.:2.000   3rd Qu.:39.00  
     Max.   :3.000      Max.   :3.000      Max.   :2.000   Max.   :40.00  
     NA's   :158        NA's   :151        NA's   :129     NA's   :185    
     score.information
     Min.   :13.00    
     1st Qu.:28.00    
     Median :33.00    
     Mean   :31.91    
     3rd Qu.:38.00    
     Max.   :40.00    
     NA's   :176      



```R
names(data)
```


<ol class=list-inline>
	<li>'service'</li>
	<li>'sexe'</li>
	<li>'age'</li>
	<li>'profession'</li>
	<li>'amelioration.sante'</li>
	<li>'amelioration.moral'</li>
	<li>'recommander'</li>
	<li>'score.relation'</li>
	<li>'score.information'</li>
</ol>




```R
# les variables (service, sexe, profession) sont les trois variables catégorielles codées
tab.service <- table(data$service) # on ne prend pas en compte les valeurs manquantes
tab.service
```


    
     1  2  3  4  5  6  7  8 
    65 59 70 69 71 64 67 69 



```R
sum(tab.service)
```


534



```R
65+59+70+69+71+64+67+69
```


534



```R
# le pourcentage de sujets dans les différents catégories de la variable service est
tab.service/sum(tab.service) * 100
```


    
           1        2        3        4        5        6        7        8 
    12.17228 11.04869 13.10861 12.92135 13.29588 11.98502 12.54682 12.92135 



```R
# le pourcentage de sujets dans les différents catégories de la variable sexe est
tab.sexe <- table(data$sexe) # on ne prend pas en compte les valeurs manquantes
tab.sexe/sum(tab.sexe) * 100
```


    
           0        1 
    50.18727 49.81273 



```R
# le recodage des catégories peut être important
data$sexe.c <- factor(data$sexe, labels=c('homme', 'femme'))
tab.sexe.c <- table(data$sexe.c)
```


```R
print(round(prop.table(tab.sexe.c) *100, digits=2)) # more direct!
```

    
    homme femme 
    50.19 49.81 
    


```R
# le pourcentage de sujets dans les différents catégories de la variable profession est
tab.prof <- table(data$prof) # on ne prend pas en compte les valeurs manquantes
tab.prof/sum(tab.prof) * 100
```


    
            1         2         3         4         5         6         7         8 
     0.234192  8.899297 29.039813 20.608899 16.159251 10.304450  5.152225  9.601874 



```R
sum(tab.prof/sum(tab.prof) * 100)
```


100


##### Pour les autres variables, donnez de façon synthétique : moyenne, médiane, écart-type, minimum, maximum, nombre de données disponibles (non manquantes).


```R
# il est nécessaire d'importer le module prettyR
library(prettyR)
```


```R
describe(data$age, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
```

    Description of structure(list(x = c(41L, 29L, 83L, 66L, 84L, 84L, 60L, 85L,  28L, 35L, 84L, 78L, 35L, 34L, 49L, 30L, 64L, 62L, 89L, 48L, 57L,  76L, 56L, 27L, 68L, 54L, 65L, 25L, 61L, 58L, 67L, 62L, 37L, 83L,  52L, 69L, 58L, 75L, 59L, 40L, 50L, 83L, 34L, 75L, 69L, 39L, 69L,  58L, 53L, 78L, 82L, 81L, 81L, 66L, 36L, 60L, 45L, 78L, 54L, 84L,  59L, 53L, 62L, 46L, 60L, 63L, 67L, 77L, 68L, 52L, 72L, 64L, 67L,  51L, 36L, 78L, 79L, 54L, 69L, 49L, 67L, 65L, 64L, 65L, 72L, 62L,  83L, 49L, 75L, 52L, 58L, 50L, 27L, 64L, 45L, 54L, 45L, 80L, 81L,  59L, 64L, 42L, 42L, 41L, 81L, 23L, 79L, 54L, 61L, 39L, 53L, 51L,  32L, 59L, 63L, 69L, 52L, 18L, 64L, 47L, 46L, 39L, 43L, 40L, 64L,  44L, 45L, 86L, 49L, 42L, 71L, 32L, 56L, 49L, 31L, 66L, 67L, 70L,  62L, 72L, 55L, 28L, 62L, 48L, 43L, 70L, 80L, 61L, 56L, 80L, 21L,  75L, 40L, 53L, 80L, 58L, 51L, 79L, 72L, 40L, 29L, 40L, 32L, 63L,  80L, 29L, 84L, 70L, 87L, 43L, 81L, 28L, 76L, 82L, 67L, 64L, 84L,  95L, 55L, 78L, 45L, 40L, 90L, 50L, 85L, 77L, 30L, 97L, 27L, 36L,  61L, 91L, 65L, 63L, 74L, 89L, 77L, 73L, 30L, 36L, 47L, 41L, 34L,  18L, 43L, 66L, 55L, 26L, 32L, 63L, NA, 39L, 43L, 75L, 46L, 42L,  60L, 84L, 69L, 19L, 74L, 23L, 52L, 23L, 61L, 27L, 69L, 51L, 65L,  38L, 69L, 70L, 68L, 60L, 29L, 35L, 57L, 88L, 45L, 18L, 32L, 44L,  59L, NA, NA, NA, 66L, 45L, 60L, 88L, 47L, 43L, 46L, 39L, 67L,  75L, 79L, 20L, 43L, 63L, 63L, 40L, 62L, 63L, 57L, 26L, NA, 38L,  45L, 34L, 44L, 65L, 96L, NA, 43L, 75L, 38L, 44L, 53L, 38L, 48L,  70L, 65L, 49L, 47L, 71L, 76L, 66L, 69L, 60L, 64L, 59L, 29L, 33L,  68L, 64L, 90L, 66L, 72L, 84L, 75L, 78L, 55L, 92L, 55L, 53L, 48L,  55L, 74L, 60L, 41L, 75L, 70L, 57L, 88L, 50L, 50L, 25L, 22L, 80L,  70L, 72L, 68L, 54L, 58L, 52L, 41L, 79L, 57L, 26L, 59L, 45L, 83L,  47L, 74L, 69L, 67L, 36L, 76L, 83L, 87L, 76L, 84L, 57L, 67L, 75L,  82L, 84L, 22L, 60L, 55L, 40L, 48L, 83L, 55L, 58L, 65L, 91L, 85L,  67L, 75L, 46L, 74L, 69L, 60L, 55L, 72L, 70L, 43L, 49L, 92L, 64L,  74L, 75L, 64L, 77L, 82L, 75L, 60L, 64L, 61L, 50L, 42L, 65L, 75L,  90L, 57L, 42L, 66L, 60L, 73L, 51L, 85L, 88L, 82L, 50L, 82L, 31L,  39L, 49L, 54L, 32L, 76L, 40L, 60L, 55L, 52L, 52L, 35L, 42L, 40L,  78L, 77L, 49L, 56L, 58L, 39L, 82L, 37L, 81L, 55L, 59L, 77L, 68L,  45L, 67L, 51L, 70L, 83L, 72L, 75L, 43L, 29L, 67L, 40L, 37L, 50L,  40L, 67L, 66L, 79L, 65L, 44L, 88L, 56L, 47L, 58L, 75L, 85L, 75L,  46L, 49L, 61L, 69L, 38L, 48L, 84L, 60L, 76L, 60L, 80L, 84L, 50L,  45L, 47L, 73L, 75L, 43L, 49L, 56L, 50L, 46L, 63L, 87L, 73L, 63L,  33L, 32L, 21L, 71L, 72L, 53L, 30L, 63L, 26L, 91L, 54L, 55L, 78L,  30L, 45L, 44L, 61L, 64L, 44L, 55L, 48L, 57L, 65L, 77L, 72L, 36L,  59L, 19L, 66L, 20L, 21L, 26L, 32L, 68L, 57L, 70L, 55L, 39L, 71L,  62L, 22L, 58L, 56L, 70L, 59L, 78L, 77L, 66L, 58L, 31L, 69L, 67L,  70L, 81L, 69L, 30L, 30L, 50L)), row.names = c(NA, -534L), class = "data.frame") 
    


    
     Numeric 
       mean median    sd min max valid.n
    x 58.21     60 17.81  18  97     528



```R
# représentation plus compacte de toutes les variables
describe(data[c(3,5,6,7,8,9)], num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
```

    Description of data[c(3, 5, 6, 7, 8, 9)] 
    


    
     Numeric 
                        mean median    sd min max valid.n
    age                58.21     60 17.81  18  97     528
    amelioration.sante  2.23      2  0.77   0   3     376
    amelioration.moral  1.68      1  0.95   0   3     383
    recommander         1.62      2  0.56   0   2     405
    score.relation     35.22     36  4.62  13  40     349
    score.information  31.91     33  6.79  13  40     358



```R
describe(data[c(-1,-2,-4)], num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
```

    Description of data[c(-1, -2, -4)] 
    


    
     Numeric 
                        mean median    sd min max valid.n
    age                58.21     60 17.81  18  97     528
    amelioration.sante  2.23      2  0.77   0   3     376
    amelioration.moral  1.68      1  0.95   0   3     383
    recommander         1.62      2  0.56   0   2     405
    score.relation     35.22     36  4.62  13  40     349
    score.information  31.91     33  6.79  13  40     358
    
     Factor 
             
    sexe.c     homme  femme
      Count   268.00 266.00
      Percent  50.19  49.81
    Mode homme 


##### Faites un histogramme du score de relation (score.relation).


```R
# personnellement dans le cas présent je pense que montrer une barre pour chaque score est utile
hist(data$score.relation, main='répartition du score de relation',
    xlab='score de relation', ylab="nombre d'observations", nclass=(40-13),
    col=rgb(223,241,203, maxColorValue=255), border="black", labels=TRUE, prob=F, las=1)

# un peu de personnalisation en plus des
# reflexes essentiels tels que nommer les axes et donner un titre au graphique
```


![png](devoir1-01_files/devoir1-01_22_0.png)



```R
# histogramme amélioré
library(ggplot2)
ggplot(data = data) + geom_histogram(
    mapping = aes(x = data$score.relation), bins = 10, na.rm = TRUE) + labs(
    y = "Nombre", x = "Qualite relation") + scale_x_continuous(
    labels=c("10" = "Mediocre", "20" = "Mauvaise", "30" = "Bonne", "40" = "Excellente"))
```




![png](devoir1-01_files/devoir1-01_23_1.png)


##### A l’aide de deux « boxplots », représentez côte à côte la distribution du score de relation chez les hommes et les femmes.


```R
boxplot(data$score.relation~factor( # factorisation du paramètre sexe
    data$sexe, labels=c('M', 'F')), range=.9, varwidth=TRUE, 
        xlab='sexe', ylab='score de relation', boxwex=0.6, horizontal=FALSE,
        main='distribution du score de relation en fonction du sexe',
        medianLwd=10, col=c('blue', 'red'), na.rm=TRUE, las=1) # et personnalisation
```


![png](devoir1-01_files/devoir1-01_25_0.png)



```R
ggplot(data = data)  + geom_boxplot(
    mapping = aes(y = data$score.relation, group = data$sexe), na.rm = TRUE) + labs(
    x = NULL, y = "Qualite relation") + scale_y_continuous(
    limits = c(10,40), labels=c("10" = "Mediocre", "20" = "Mauvaise", "30" = "Bonne", "40" = "Excellente"))
```




![png](devoir1-01_files/devoir1-01_26_1.png)



```R

```
