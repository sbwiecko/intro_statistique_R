
1. Estimez le modèle de régression linéaire expliquant la variable « score.relation » par les variables « age », « sexe », « score.information », « amelioration.sante », « amelioration.moral », « profession »,  « service ». (le script doit inclure la vérification éventuelle des conditions de validité de la méthode utilisée)


```R
data = read.csv2('../data/satisfaction_hopital.csv')
```


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
# application d'une régression linéaire multiple avec des variables catégorielles
model = lm(score.relation~age+sexe+score.information+amelioration.sante+
   amelioration.moral+profession+service, data=data)
print(model)
```

    
    Call:
    lm(formula = score.relation ~ age + sexe + score.information + 
        amelioration.sante + amelioration.moral + profession + service, 
        data = data)
    
    Coefficients:
           (Intercept)                 age                sexe   score.information  
              20.74420             0.04276            -0.49000             0.27390  
    amelioration.sante  amelioration.moral          profession             service  
               0.65586             0.74913             0.07315             0.10190  
    
    


```R
# vérifions la condition de validité du modèle absence de structure de corrélation du bruit
# en affichant les points résiduels du modèle précedent
hist(resid(model))
# ça n'a pas l'air centré autour de zéro, pour moi cette condition de validité n'est pas vérifiée...
```


![png](output_4_0.png)


##### Corrigé


```R
# Il est nécessaire de recoder les variables catégorielles qui ont plus de
# deux classes pour réaliser correctement les analyses de régression
# linéaire. Les variables binaires (telles que sexe) sont correctement traitées.

data$profession.cat<-factor(data$profession)
data$amelioration.sante.cat<-factor(data$amelioration.sante)
data$amelioration.moral.cat<-factor(data$amelioration.moral)
data$service.cat<-factor(data$service)
```


```R
mod1<-lm(score.relation~age+sexe+score.information+
         amelioration.sante.cat+amelioration.moral.cat+profession.cat+service.cat, data=data)

# On test ce modèle avec l’effet global de chacune des variables
# (incluant les variables catégorielles à plus de deux classes)

drop1(mod1,.~.,test="F")
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Sum of Sq</th><th scope=col>RSS</th><th scope=col>AIC</th><th scope=col>F value</th><th scope=col>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th scope=row>&lt;none&gt;</th><td>NA          </td><td>       NA   </td><td>3625.161    </td><td>778.9467    </td><td>       NA   </td><td>          NA</td></tr>
	<tr><th scope=row>age</th><td> 1          </td><td> 47.95865   </td><td>3673.119    </td><td>780.7449    </td><td> 3.505788   </td><td>6.225595e-02</td></tr>
	<tr><th scope=row>sexe</th><td> 1          </td><td> 25.63878   </td><td>3650.799    </td><td>778.9834    </td><td> 1.874200   </td><td>1.721541e-01</td></tr>
	<tr><th scope=row>score.information</th><td> 1          </td><td>563.44533   </td><td>4188.606    </td><td>818.6983    </td><td>41.187972   </td><td>6.342560e-10</td></tr>
	<tr><th scope=row>amelioration.sante.cat</th><td> 3          </td><td>315.45185   </td><td>3940.612    </td><td>797.0601    </td><td> 7.686532   </td><td>6.063976e-05</td></tr>
	<tr><th scope=row>amelioration.moral.cat</th><td> 3          </td><td>593.71681   </td><td>4218.877    </td><td>816.7794    </td><td>14.466941   </td><td>9.351124e-09</td></tr>
	<tr><th scope=row>profession.cat</th><td> 7          </td><td>129.94016   </td><td>3755.101    </td><td>775.1242    </td><td> 1.356950   </td><td>2.238966e-01</td></tr>
	<tr><th scope=row>service.cat</th><td> 7          </td><td>185.75353   </td><td>3810.914    </td><td>779.3881    </td><td> 1.939803   </td><td>6.367215e-02</td></tr>
</tbody>
</table>




```R
# Conditions de validité :
# normalité du bruit du modèle
hist(resid(mod1))
# l'histogramme a plus ou moins une courbe normale, on valide cette hypothèse
# les autres conditions de validité sont difficile à prouver (variance du bruit 
# indépendant de la variance des variables explicatives et de la variance de la variable 
# à expliquer ; "vrai" bruit (pas de corrélation interne)) et n'ont pas été démontré dans 
# le cours ; on assumera donc de par la normalité du bruit, que le modèle est validé
```


![png](output_8_0.png)


2. Estimez le modèle de régression logistique expliquant la variable « recommander.b » par les variables « age », « sexe », « score.information », « amelioration.sante », « amelioration.moral », « profession »,  « service ».  Notons que la variable « recommander.b » est une transformation de la variable « recommander» en une variable binaire où « recommander.b » vaut 0 si « recommander» vaut 0 ou 1, et 1 si « recommander» vaut 2. (le script doit inclure la vérification éventuelle des conditions de validité de la méthode utilisée)


```R
# recodons la variable recommander
data$recommander.b = ifelse(data$recommander == 2, 1, 0)
```


```R
# pour la régression logistique, nous utilisons le modèle linéaire généralisé
# la condition principale de validité du modèle étant la présence d'au moins 5 à 10
# évènement par variable explicative, on vérifie celà avec la fonction describe de prettyR
```


```R
library(prettyR)
describe(data)
```


```R
model2 = glm(recommander.b~age+sexe+score.information+amelioration.sante+
   amelioration.moral+profession+service, data=data)
print(model2)
```

##### Corrigé


```R
# codage du recommender.b
data$recommander.b <- ifelse(data$recommander == 2, 1, 0)
# si data$recommander vaut 2, alors data$recommander.b vaut 1 ; sinon, il vaut 0
# la profession est déjà modifiée en variable qualitative, il n'y a pas besoin de rechanger cela
# la référence est toujours "agriculteur"
```


```R
mod2 <- glm(recommander.b ~ age + sexe + score.information + amelioration.sante + 
            amelioration.moral + profession + service, data = data)

# On regarde les conditions de validité du modèle. Il faut au moins 5 à 10
# évènements par variable explicative.

table(data$recommander.b)
library("Epi")
library("prettyR")
describe(data)

# Pour la variable à expliquer, on a 136 détenus pour la classe 0 de
# « recommander.b » et 269 détenus pour la classe 1 de « recommander.b ».
# Pour les variables explicatives, on en a en fait 1 pour « age », 1 pour
# « sexe », 1 pour « score.information »,
# 3 pour « amelioration.sante.cat », 3 pour « amelioration.moral.cat »,
# 7 pour « profession.cat », 7 pour « service.cat », soit un total de 23.
# 23*5=115 et 23*10=230.
# Si l’on s’intéresse à la classe 0 de « recommander.b » (136 détenus),
# nous sommes dans la fourchette des conditions de validité. Si l’on
# s’intéresse à la classe 1 de « recommander.b » (269 détenus), nous
# sommes dans les conditions de validité.

# On teste le modèle
drop1(mod2,.~., test="Chisq")
```


    
      0   1 
    136 269 


    Description of data 
    


    
     Numeric 
                        mean median    var    sd valid.n
    service             4.55      5   5.19  2.28     534
    sexe                0.50      0   0.25  0.50     534
    age                58.21     60 317.17 17.81     528
    profession          4.43      4   3.06  1.75     427
    amelioration.sante  2.23      2   0.59  0.77     376
    amelioration.moral  1.68      1   0.90  0.95     383
    recommander         1.62      2   0.31  0.56     405
    score.relation     35.22     36  21.38  4.62     349
    score.information  31.91     33  46.15  6.79     358
    recommander.b       0.66      1   0.22  0.47     405
    
     Factor 
                  
    profession.cat      3   <NA>     4     5     6     8     2     7    1
           Count   124.00 107.00 88.00 69.00 44.00 41.00 38.00 22.00 1.00
           Percent  23.22  20.04 16.48 12.92  8.24  7.68  7.12  4.12 0.19
    Mode 3 
                          
    amelioration.sante.cat      3   <NA>      2     1    0
                   Count   161.00 158.00 144.00 68.00 3.00
                   Percent  30.15  29.59  26.97 12.73 0.56
    Mode 3 
                          
    amelioration.moral.cat      1   <NA>      3     2     0
                   Count   179.00 151.00 106.00 73.00 25.00
                   Percent  33.52  28.28  19.85 13.67  4.68
    Mode 1 
               
    service.cat    5     3     4     8     7     1     6     2
        Count   71.0 70.00 69.00 69.00 67.00 65.00 64.00 59.00
        Percent 13.3 13.11 12.92 12.92 12.55 12.17 11.99 11.05
    Mode 5 



<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Deviance</th><th scope=col>AIC</th><th scope=col>scaled dev.</th><th scope=col>Pr(&gt;Chi)</th></tr></thead>
<tbody>
	<tr><th scope=row>&lt;none&gt;</th><td>NA          </td><td>57.32199    </td><td>375.0709    </td><td>        NA  </td><td>          NA</td></tr>
	<tr><th scope=row>age</th><td> 1          </td><td>57.66626    </td><td>374.9511    </td><td> 1.8802157  </td><td>1.703096e-01</td></tr>
	<tr><th scope=row>sexe</th><td> 1          </td><td>57.77867    </td><td>375.5626    </td><td> 2.4917063  </td><td>1.144476e-01</td></tr>
	<tr><th scope=row>score.information</th><td> 1          </td><td>62.40803    </td><td>399.7639    </td><td>26.6930089  </td><td>2.384828e-07</td></tr>
	<tr><th scope=row>amelioration.sante</th><td> 1          </td><td>58.11662    </td><td>377.3938    </td><td> 4.3229307  </td><td>3.760211e-02</td></tr>
	<tr><th scope=row>amelioration.moral</th><td> 1          </td><td>57.83739    </td><td>375.8815    </td><td> 2.8106472  </td><td>9.364059e-02</td></tr>
	<tr><th scope=row>profession</th><td> 1          </td><td>57.40262    </td><td>373.5123    </td><td> 0.4413696  </td><td>5.064621e-01</td></tr>
	<tr><th scope=row>service</th><td> 1          </td><td>57.35998    </td><td>373.2789    </td><td> 0.2079967  </td><td>6.483421e-01</td></tr>
</tbody>
</table>




```R

```
