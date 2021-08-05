
#### 1. Nous souhaitons afficher la valeur minimale observée dans une série de 10 observations incluant 2 valeurs manquantes. La variable est appelée x. L'instruction min(x) fournit-elle le résultat escompté ?


```R
data<-c(1,4,0,NA,5,13,-34,NA,100,-0)
```


```R
min(data)
```


&lt;NA&gt;



```R
min(data, na.rm=TRUE)
```


-34


#### 2. Nous souhaitons associer les étiquettes « Non » et « Oui » aux valeurs 0 et 1, respectivement, d'une variable appelée z. Quelle commande pouvons-nous utiliser ?


```R
z<-c(0,1,1,1,0,1,1,1,0,0,1,0)
factor(z, labels=c('Non', 'Oui'))
# no need for factor(z, levels=c(0,1), labels=c('Non', 'Oui'))
```


<ol class=list-inline>
	<li>Non</li>
	<li>Oui</li>
	<li>Oui</li>
	<li>Oui</li>
	<li>Non</li>
	<li>Oui</li>
	<li>Oui</li>
	<li>Oui</li>
	<li>Non</li>
	<li>Non</li>
	<li>Oui</li>
	<li>Non</li>
</ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>'Non'</li>
		<li>'Oui'</li>
	</ol>
</details>


#### 3. Pour une variable qualitative z présentant des valeurs manquantes, la commande sum(table(z)) fournit :


```R
val<-c(1,2,3,NA, 5,6,-12, NA)
table(val)
```


    val
    -12   1   2   3   5   6 
      1   1   1   1   1   1 



```R
sum(table(val))
```


6


L'effectif total observé (sans les individus ayant des données manquantes)


```R
table(val, useNA='always')
```


    val
     -12    1    2    3    5    6 <NA> 
       1    1    1    1    1    1    2 



```R
sum(table(val, useNA='always'))
```


8


#### 4. Ouvrez le fichier smp1.csv dans un éditeur de texte (type bloc-note, Word...) et cochez la proposition correspondant à la première ligne (avec ou sans sans guillemets autour des noms de variables) :


```R
# executing cat -head 1 ../data/smp1.csv
```

#### 5. Donnez la borne supérieure de l'intervalle interquartile pour la variable dur.interv en considérant l'ensemble des individus.


```R
smp <- read.csv2("../data/smp2.csv")
```


```R
str(smp)
```

    'data.frame':	799 obs. of  26 variables:
     $ age         : int  31 49 50 47 23 34 24 52 42 45 ...
     $ prof        : Factor w/ 8 levels "agriculteur",..: 3 NA 7 6 8 6 3 2 6 6 ...
     $ duree       : int  4 NA 5 NA 4 NA NA 5 4 NA ...
     $ discip      : int  0 0 0 0 1 0 0 0 1 0 ...
     $ n.enfant    : int  2 7 2 0 1 3 5 2 1 2 ...
     $ n.fratrie   : int  4 3 2 6 6 2 3 9 12 5 ...
     $ ecole       : int  1 2 2 1 1 2 1 2 1 2 ...
     $ separation  : int  0 1 0 1 1 0 1 0 1 0 ...
     $ juge.enfant : int  0 0 0 0 NA 0 1 0 1 0 ...
     $ place       : int  0 0 0 1 1 0 1 0 0 0 ...
     $ abus        : int  0 0 0 0 0 0 0 0 1 1 ...
     $ grav.cons   : int  1 2 2 1 2 1 5 1 5 5 ...
     $ dep.cons    : int  0 0 0 0 1 0 1 0 1 0 ...
     $ ago.cons    : int  1 0 0 0 0 0 0 0 0 0 ...
     $ ptsd.cons   : int  0 0 0 0 0 0 0 0 0 0 ...
     $ alc.cons    : int  0 0 0 0 0 0 0 0 1 1 ...
     $ subst.cons  : int  0 0 0 0 0 0 1 0 1 0 ...
     $ scz.cons    : int  0 0 0 0 0 0 0 0 0 0 ...
     $ char        : int  1 1 1 1 1 1 1 1 4 1 ...
     $ rs          : int  2 2 2 2 2 1 3 2 3 2 ...
     $ ed          : int  1 2 3 2 2 2 3 2 3 2 ...
     $ dr          : int  1 1 2 2 2 1 2 2 1 2 ...
     $ suicide.s   : int  0 0 0 1 0 0 3 0 4 0 ...
     $ suicide.hr  : int  0 0 0 0 0 0 1 0 1 0 ...
     $ suicide.past: int  0 0 0 0 1 0 1 0 1 0 ...
     $ dur.interv  : int  NA 70 NA 105 NA NA 105 84 78 60 ...
    


```R
names(smp)
```


<ol class=list-inline>
	<li>'age'</li>
	<li>'prof'</li>
	<li>'duree'</li>
	<li>'discip'</li>
	<li>'n.enfant'</li>
	<li>'n.fratrie'</li>
	<li>'ecole'</li>
	<li>'separation'</li>
	<li>'juge.enfant'</li>
	<li>'place'</li>
	<li>'abus'</li>
	<li>'grav.cons'</li>
	<li>'dep.cons'</li>
	<li>'ago.cons'</li>
	<li>'ptsd.cons'</li>
	<li>'alc.cons'</li>
	<li>'subst.cons'</li>
	<li>'scz.cons'</li>
	<li>'char'</li>
	<li>'rs'</li>
	<li>'ed'</li>
	<li>'dr'</li>
	<li>'suicide.s'</li>
	<li>'suicide.hr'</li>
	<li>'suicide.past'</li>
	<li>'dur.interv'</li>
</ol>




```R
summary(smp$dur.interv)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
       0.00   48.00   60.00   61.89   75.00  120.00      50 


#### 6. Nous souhaitons recoder la taille de la fratrie (n.fratrie) en variable binaire : « moins de 5 enfants » ('<5') et « 5 enfants ou plus » ('5+'). Quelle commande peut-on utiliser ? (Dans les expressions suivantes, le point-virgule sert à délimiter deux instructions).


```R
table(smp$n.fratrie, useNA = 'always')
```


    
       0    1    2    3    4    5    6    7    8    9   10   11   12   13   14   16 
      76   86  111  129   90   75   63   41   33   31   22   14   10    4    3    3 
      17   18   19   20   21 <NA> 
       1    2    3    1    1    0 



```R
levels(factor(smp$n.fratrie))
```


<ol class=list-inline>
	<li>'0'</li>
	<li>'1'</li>
	<li>'2'</li>
	<li>'3'</li>
	<li>'4'</li>
	<li>'5'</li>
	<li>'6'</li>
	<li>'7'</li>
	<li>'8'</li>
	<li>'9'</li>
	<li>'10'</li>
	<li>'11'</li>
	<li>'12'</li>
	<li>'13'</li>
	<li>'14'</li>
	<li>'16'</li>
	<li>'17'</li>
	<li>'18'</li>
	<li>'19'</li>
	<li>'20'</li>
	<li>'21'</li>
</ol>




```R
levels(factor(smp$n.fratrie))[1:5] <- '<5'
levels(factor(smp$n.fratrie))[6:21]  <- '5+'
```


    Error in levels(factor(smp$n.fratrie))[1:5] <- "<5": impossible de trouver la fonction "factor<-"
    Traceback:
    



```R
factor(table(smp$n.fratrie <= 5),labels=c('<5', '5+'))
```


<dl class=dl-horizontal>
	<dt>FALSE</dt>
		<dd>&lt;5</dd>
	<dt>TRUE</dt>
		<dd>5+</dd>
</dl>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>'&lt;5'</li>
		<li>'5+'</li>
	</ol>
</details>


#### 7. Donnez le nombre de lignes du tableau de données pour lesquelles la variable ecole vaut 1, 2 ou 3:


```R
table(smp$ecole, useNA = 'always')
```


    
       1    2    3    4    5 <NA> 
     340  301   90   45   18    5 



```R
sum(table(smp$ecole <= 3, useNA='always')) #doesn't work?!
```


799



```R
340+301+90
```


731



```R
sum(smp$ecole <= 3, na.rm=TRUE) # count TRUE excluding NA
```


731



```R
table(smp$ecole < 4)
```


    
    FALSE  TRUE 
       63   731 


#### 8. Donnez le nombre d'individus sans emploi:


```R
names(smp)
```


<ol class=list-inline>
	<li>'age'</li>
	<li>'prof'</li>
	<li>'duree'</li>
	<li>'discip'</li>
	<li>'n.enfant'</li>
	<li>'n.fratrie'</li>
	<li>'ecole'</li>
	<li>'separation'</li>
	<li>'juge.enfant'</li>
	<li>'place'</li>
	<li>'abus'</li>
	<li>'grav.cons'</li>
	<li>'dep.cons'</li>
	<li>'ago.cons'</li>
	<li>'ptsd.cons'</li>
	<li>'alc.cons'</li>
	<li>'subst.cons'</li>
	<li>'scz.cons'</li>
	<li>'char'</li>
	<li>'rs'</li>
	<li>'ed'</li>
	<li>'dr'</li>
	<li>'suicide.s'</li>
	<li>'suicide.hr'</li>
	<li>'suicide.past'</li>
	<li>'dur.interv'</li>
</ol>




```R
table(smp$prof)
```


    
           agriculteur            artisan              autre              cadre 
                     6                 90                 31                 24 
               employe            ouvrier prof.intermediaire        sans emploi 
                   135                227                 58                222 



```R
table(smp$prof == 'sans emploi')
```


    
    FALSE  TRUE 
      571   222 


#### 2. Quelle commande permet d'obtenir le nombre total d'individus sans données manquantes ?


```R
sum(complete.cases(smp))
```


403


#### 3. Quel est l'âge moyen des dix premiers individus du tableau de données?


```R
mean(smp$age[1:10], na.rm = TRUE)
```


39.7



```R
smp$age[1:10]
```


<ol class=list-inline>
	<li>31</li>
	<li>49</li>
	<li>50</li>
	<li>47</li>
	<li>23</li>
	<li>34</li>
	<li>24</li>
	<li>52</li>
	<li>42</li>
	<li>45</li>
</ol>



#### 4. Quelle est la valeur médiane pour la durée d'intervention (dur.interv) en ne considérant que les 300 premières observations du data frame smp ?


```R
median(smp$dur.interv[1:300], na.rm = TRUE)
```


50



```R
smp$dur.interv[1:30]
```


<ol class=list-inline>
	<li>&lt;NA&gt;</li>
	<li>70</li>
	<li>&lt;NA&gt;</li>
	<li>105</li>
	<li>&lt;NA&gt;</li>
	<li>&lt;NA&gt;</li>
	<li>105</li>
	<li>84</li>
	<li>78</li>
	<li>60</li>
	<li>&lt;NA&gt;</li>
	<li>35</li>
	<li>95</li>
	<li>90</li>
	<li>80</li>
	<li>&lt;NA&gt;</li>
	<li>90</li>
	<li>90</li>
	<li>25</li>
	<li>95</li>
	<li>55</li>
	<li>&lt;NA&gt;</li>
	<li>90</li>
	<li>105</li>
	<li>83</li>
	<li>75</li>
	<li>50</li>
	<li>&lt;NA&gt;</li>
	<li>100</li>
	<li>&lt;NA&gt;</li>
</ol>




```R
median(smp$dur.interv[1:300])
```


&lt;NA&gt;



```R

```
