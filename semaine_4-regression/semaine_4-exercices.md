
Les exercices 1 à 3 sont indépendants des données “santé mentale en prison” (smp) et reposent sur la compréhension et l'utilisation du logiciel R à partir de données artificielles. Les exercices 4 à 6 portent sur les données smp, disponibles dans un data frame (ou tableau de données)


```R
data=read.csv2('../data/smp2.csv')
```


```R
str(data)
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
    

##### 1. Pour réaliser une ANOVA à un facteur entre les variables y (réponse) et z (facteur) dans le data frame d, nous utilisons la commande :


```R
lm(data$age~data$subst.cons)
```


    
    Call:
    lm(formula = data$age ~ data$subst.cons)
    
    Coefficients:
        (Intercept)  data$subst.cons  
              41.97           -11.60  
    



```R
anova(lm(data$age~data$subst.cons))
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Sum Sq</th><th scope=col>Mean Sq</th><th scope=col>F value</th><th scope=col>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th scope=row>data$subst.cons</th><td>  1         </td><td> 20880.3    </td><td>20880.2972  </td><td>138.8856    </td><td>1.165665e-29</td></tr>
	<tr><th scope=row>Residuals</th><td>795         </td><td>119521.7    </td><td>  150.3417  </td><td>      NA    </td><td>          NA</td></tr>
</tbody>
</table>



##### 2. Dans une régression logistique, R avec la fonction glm() fournit directement les odds-ratio.




```R
# FAUX - utiliser exp(coef) si 'binomial' est utilisé sans scale
```

##### 3. La commande predict(mod) où mod est le résultat d'un modèle de régression logistique fourni par la commande glm(z ~ y, data=d, family=binomial("logit")) fournit :


```R
# aucune proposition exacte
```

##### 4. Nous considérons l'âge (age) des individus ayant 4 enfants ou plus (n.enfant) et dont la catégorie socio-professionnelle (prof) figure parmi les modalités suivantes : « sans emploi », « ouvrier », « cadre » et « employé ». Pour ce sous-ensemble de l'échantillon du data frame smp, le rapport entre les deux variances les plus extrêmes dans ces 4 groupes est :


```R
sub = subset(data, n.enfant >= 4 & prof %in% c(
"sans emploi", "ouvrier", "cadre", "employé"))
```


```R
#refactorisation
sub$prof = factor(sub$prof, levels=c("sans emploi", "ouvrier", "cadre", "employé"))
```


```R
aggregate(age~prof, var, data=sub)
```


<table>
<thead><tr><th scope=col>prof</th><th scope=col>age</th></tr></thead>
<tbody>
	<tr><td>sans emploi</td><td>281.22615  </td></tr>
	<tr><td>ouvrier    </td><td> 88.22619  </td></tr>
	<tr><td>cadre      </td><td>158.00000  </td></tr>
</tbody>
</table>




```R
281.22615/88.22619
```


3.18755859229555


REPONSE


```R
aggregate(age ~ prof, data = subset(
    data, n.enfant > 3 & prof %in% c(
        "sans emploi", "ouvrier", "cadre", "employe"), c(age, prof)), var)
```


<table>
<thead><tr><th scope=col>prof</th><th scope=col>age</th></tr></thead>
<tbody>
	<tr><td>cadre      </td><td>158.00000  </td></tr>
	<tr><td>employe    </td><td>135.71667  </td></tr>
	<tr><td>ouvrier    </td><td> 88.22619  </td></tr>
	<tr><td>sans emploi</td><td>281.22615  </td></tr>
</tbody>
</table>



##### 5. Nous souhaitons réaliser une ANOVA à un facteur en considérant l'âge (age) comme variable réponse, et la taille de la fratrie (n.fratrie) recodée en 3 classes (0-2, 3-4, 5+) comme variable explicative. Les bornes des intervalles sont inclues pour chacune des trois classes. Indiquer le résultat du test F de Fisher-Snedecor d’égalité des moyennes :


```R
max(data$n.fratrie)
```


21



```R
#data$n.fratrie.b = cut(data$n.fratrie, breaks = c(0,3,5,21), include.lowest = FALSE)
```


```R
data$n.fratrie.b = ifelse(data$n.fratrie>=5,2, ifelse(data$n.fratrie<=2,0,1))
```


```R
table(data$n.fratrie.b, useNA = 'always')
```


    
       0    1    2 <NA> 
     273  219  307    0 



```R
anova(lm(age~n.fratrie.b, data=data))
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Sum Sq</th><th scope=col>Mean Sq</th><th scope=col>F value</th><th scope=col>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th scope=row>n.fratrie.b</th><td>  1       </td><td>   984.762</td><td>984.7620  </td><td>5.615417  </td><td>0.01804101</td></tr>
	<tr><th scope=row>Residuals</th><td>795       </td><td>139417.208</td><td>175.3676  </td><td>      NA  </td><td>        NA</td></tr>
</tbody>
</table>



REPONSE


```R
n.fratrie.c <- cut(data$n.fratrie, breaks = c(0, 2, 4, 21), include.lowest = TRUE)
anova(lm(age ~ n.fratrie.c, data = data))
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Sum Sq</th><th scope=col>Mean Sq</th><th scope=col>F value</th><th scope=col>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th scope=row>n.fratrie.c</th><td>  2        </td><td>   985.1707</td><td>492.5854   </td><td>2.805349   </td><td>0.06108532 </td></tr>
	<tr><th scope=row>Residuals</th><td>794        </td><td>139416.7992</td><td>175.5879   </td><td>      NA   </td><td>        NA </td></tr>
</tbody>
</table>




```R
table(n.fratrie.c)
```


    n.fratrie.c
     [0,2]  (2,4] (4,21] 
       273    219    307 


##### 6. Nous nous intéressons à la relation entre la variable séparation (separation) et l'âge (age) des individus, que l'on modélise à l'aide d'une régression logistique. Donner la borne inférieure de l'intervalle de confiance à 95 % pour l'odds-ratio (3 chiffres après la virgule).


```R
confint(glm(separation~age, data=data, family='binomial'))
```

    Waiting for profiling to be done...
    


<table>
<thead><tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr></thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>-0.25167204 </td><td> 0.630369847</td></tr>
	<tr><th scope=row>age</th><td>-0.02388803 </td><td>-0.002161716</td></tr>
</tbody>
</table>



REPONSE


```R
m <- glm(separation ~ age, data = data, family = binomial)
exp(confint(m))
```

    Waiting for profiling to be done...
    


<table>
<thead><tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr></thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>0.7774997</td><td>1.8783051</td></tr>
	<tr><th scope=row>age</th><td>0.9763950</td><td>0.9978406</td></tr>
</tbody>
</table>



#### EXERCICES FACULTATIFS

##### 1. À partir d'un modèle de régression linéaire dont les résultats ont été enregistrés dans une variable appelée mod, l'instruction fitted(mod) permet de fournir :


```R
# Les valeurs prédites de la variable réponse pour les valeurs observées de la variable explicative
```

##### 2. Pour obtenir un intervalle de confiance à 90 % pour les coefficients d'un modèle de régression logistique stocké dans une variable appelée mod, on utilise la commande :


```R
help(confint)
```


```R
confint(lm(age~n.fratrie.b, data=data), level=0.90)
```


<table>
<thead><tr><th></th><th scope=col>5 %</th><th scope=col>95 %</th></tr></thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>39.04184  </td><td>41.4897222</td></tr>
	<tr><th scope=row>n.fratrie.b</th><td>-2.21547  </td><td>-0.3987581</td></tr>
</tbody>
</table>



##### 3. Pour le modèle de régression linéaire simple dans lequel la variable durée d'interview (dur.interv) tient lieu de variable à expliquer et la variable âge (age) de variable explicative, indiquer la borne supérieure de l'intervalle de confiance à 90 % pour la pente de régression (3 chiffres après la virgule).


```R
confint(lm(dur.interv~age, data=data), level=.9)
```


<table>
<thead><tr><th></th><th scope=col>5 %</th><th scope=col>95 %</th></tr></thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>53.38432774</td><td>60.6975006 </td></tr>
	<tr><th scope=row>age</th><td> 0.03772514</td><td> 0.2147785 </td></tr>
</tbody>
</table>



##### 4. À partir du modèle de régression logistique considérant la variable suicide.hr comme variable à expliquer et age comme variable explicative, en ne considérant que les individus pour lesquels dep.cons = 1, indiquer la probabilité de haut risque suicidaire d'un individu âgé de 35 ans (3 chiffres après la virgule). [question difficile]


```R
model = glm(suicide.hr~age, data=data, subset = dep.cons==1, family=binomial)
```


```R
summary(model)
```


    
    Call:
    glm(formula = suicide.hr ~ age, family = binomial, data = data, 
        subset = dep.cons == 1)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.0945  -1.0307  -0.9727   1.3186   1.5027  
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)
    (Intercept) -0.011601   0.378754  -0.031    0.976
    age         -0.009821   0.009623  -1.021    0.307
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 409.26  on 302  degrees of freedom
    Residual deviance: 408.21  on 301  degrees of freedom
      (14 observations deleted due to missingness)
    AIC: 412.21
    
    Number of Fisher Scoring iterations: 4
    


Log(p/(1-p))=-0.0116 -0.00982*age

pour age=35 on a Log(p/(1-p))=-0.355

soit p/(1-p)=0.7

on trouve alors p = 0.7/1.7=0.412


```R

```
