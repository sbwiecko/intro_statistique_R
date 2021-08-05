

```R
data = read.csv2('../data/smp2.csv')
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



```R
plot(data$age, jitter(data$dur.interv, factor=10))
```


![png](output_2_0.png)



```R
res = lm(age ~ dur.interv, data=data)
```


```R
print(res$coefficients)
```

    (Intercept)  dur.interv 
    35.49081409  0.05821893 



```R
print(summary(res))
```


```R
Call:
lm(formula = age ~ dur.interv, data = data)

Residuals:
    Min      1Q  Median      3Q     Max 
-22.022 -11.100  -1.275   8.889  42.852 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 35.49081    1.61134  22.026   <2e-16 ***
dur.interv   0.05822    0.02479   2.349   0.0191 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 13.29 on 745 degrees of freedom
  (52 observations deleted due to missingness)
Multiple R-squared:  0.00735,	Adjusted R-squared:  0.006018 
F-statistic: 5.516 on 1 and 745 DF,  p-value: 0.0191
```


​    


```R
cor.test(data$dur.interv, data$age)
```


​    
​    	Pearson's product-moment correlation
​    
    data:  data$dur.interv and data$age
    t = 2.3487, df = 745, p-value = 0.0191
    alternative hypothesis: true correlation is not equal to 0
    95 percent confidence interval:
     0.01408787 0.15650345
    sample estimates:
           cor 
    0.08573358 



$$
r = b \times \frac{SD(age)}{SD(dur.interv)}
$$



```R
res$coefficients[2] * (sd(data$age, na.rm=TRUE)/sd(data$dur.interv, na.rm=TRUE))
```


<strong>dur.interv:</strong> 0.0393096027363509



```R
plot(data$age, jitter(data$dur.interv, factor=10))
abline(res, lwd=4, col='red')
```


![png](output_9_0.png)



```R
plot(data$dep.cons, jitter(data$dur.interv))
abline(lm(dur.interv~dep.cons, data=data), lwd=4, col='blue')
```


![png](output_10_0.png)



```R
summary(lm(dur.interv~dep.cons, data=data))
```


​    
​    Call:
​    lm(formula = dur.interv ~ dep.cons, data = data)
​    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -62.538 -13.923   1.077  12.077  61.077 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  58.9234     0.9041  65.171  < 2e-16 ***
    dep.cons      7.6143     1.4481   5.258  1.9e-07 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.33 on 747 degrees of freedom
      (50 observations deleted due to missingness)
    Multiple R-squared:  0.03569,	Adjusted R-squared:  0.0344 
    F-statistic: 27.65 on 1 and 747 DF,  p-value: 1.9e-07




```R
t.test(dur.interv~dep.cons, data=data)
```


​    
​    	Welch Two Sample t-test
​    
    data:  dur.interv by dep.cons
    t = -5.2174, df = 603.99, p-value = 2.498e-07
    alternative hypothesis: true difference in means is not equal to 0
    95 percent confidence interval:
     -10.480380  -4.748136
    sample estimates:
    mean in group 0 mean in group 1 
           58.92341        66.53767 




```R
66.53767 - 58.92341
```


7.61426000000001


#### Régression linéaire multiple

dur.interv = a + b x age + c x dep.cons + ... + bruit


```R
mod3 = lm(dur.interv~age+dep.cons+subst.cons+scz.cons,
         data=data)
```


```R
print(summary(mod3))
```


    Call:
    lm(formula = dur.interv ~ age + dep.cons + subst.cons + scz.cons, 
        data = data)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -63.654 -14.522  -1.193  11.482  62.482 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 48.90105    2.62213  18.649  < 2e-16 ***
    age          0.22096    0.05708   3.871 0.000118 ***
    dep.cons     7.38932    1.44783   5.104 4.24e-07 ***
    subst.cons   5.25157    1.74318   3.013 0.002678 ** 
    scz.cons     2.27256    2.52323   0.901 0.368062    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.1 on 742 degrees of freedom
      (52 observations deleted due to missingness)
    Multiple R-squared:  0.05833,	Adjusted R-squared:  0.05325 
    F-statistic: 11.49 on 4 and 742 DF,  p-value: 4.692e-09


​    

##### Introduction d'une variable catégorielle à plus de 2 classes
Recodage binaire pour chaque classe, e.g.
f1 : artisan=1 vs. 0
f2 : cadre=1 vs. 0
etc.


```R
mod4=lm(dur.interv~age+dep.cons+subst.cons+scz.cons+
       prof, data=data)
# category variable detected and recoded automatically
```


```R
print(summary(mod4))
```


    Call:
    lm(formula = dur.interv ~ age + dep.cons + subst.cons + scz.cons + 
        prof, data = data)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -63.280 -14.164  -1.337  10.959  63.184 
    
    Coefficients:
                            Estimate Std. Error t value Pr(>|t|)    
    (Intercept)             62.79202   10.20779   6.151 1.26e-09 ***
    age                      0.21289    0.05884   3.618 0.000317 ***
    dep.cons                 7.36792    1.45840   5.052 5.53e-07 ***
    subst.cons               5.34589    1.76902   3.022 0.002599 ** 
    scz.cons                 2.50439    2.54734   0.983 0.325863    
    profartisan            -11.48515    9.82936  -1.168 0.243005    
    profautre              -10.28748   10.33482  -0.995 0.319862    
    profcadre              -19.29636   10.38568  -1.858 0.063574 .  
    profemploye            -13.55809    9.76340  -1.389 0.165358    
    profouvrier            -14.01270    9.72111  -1.441 0.149880    
    profprof.intermediaire -13.01926    9.96911  -1.306 0.191977    
    profsans emploi        -14.27866    9.71782  -1.469 0.142174    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.11 on 731 degrees of freedom
      (56 observations deleted due to missingness)
    Multiple R-squared:  0.06595,	Adjusted R-squared:  0.05189 
    F-statistic: 4.692 on 11 and 731 DF,  p-value: 5.825e-07


​    

Il est possible de modifier la référence de cette variable


```R
data$prof = relevel(data$prof, ref='ouvrier')
```


```R
summary(lm(
    dur.interv~age+dep.cons+subst.cons+scz.cons+prof, data=data))
```

​    
​    Call:
​    lm(formula = dur.interv ~ age + dep.cons + subst.cons + scz.cons + 
​        prof, data = data)
​    

    Residuals:
        Min      1Q  Median      3Q     Max 
    -63.280 -14.164  -1.337  10.959  63.184 
    
    Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
    (Intercept)            48.77932    2.83938  17.180  < 2e-16 ***
    age                     0.21289    0.05884   3.618 0.000317 ***
    dep.cons                7.36792    1.45840   5.052 5.53e-07 ***
    subst.cons              5.34589    1.76902   3.022 0.002599 ** 
    scz.cons                2.50439    2.54734   0.983 0.325863    
    profagriculteur        14.01270    9.72111   1.441 0.149880    
    profartisan             2.52755    2.48989   1.015 0.310381    
    profautre               3.72522    3.99637   0.932 0.351567    
    profcadre              -5.28366    4.25567  -1.242 0.214798    
    profemploye             0.45460    2.12659   0.214 0.830785    
    profprof.intermediaire  0.99344    2.95809   0.336 0.737089    
    profsans emploi        -0.26596    1.87727  -0.142 0.887375    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.11 on 731 degrees of freedom
      (56 observations deleted due to missingness)
    Multiple R-squared:  0.06595,	Adjusted R-squared:  0.05189 
    F-statistic: 4.692 on 11 and 731 DF,  p-value: 5.825e-07



Effet global de la catégorie prof


```R
drop1(mod4, .~., test='F')
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Sum of Sq</th><th scope=col>RSS</th><th scope=col>AIC</th><th scope=col>F value</th><th scope=col>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th scope=row>&lt;none&gt;</th><td>NA          </td><td>       NA   </td><td>266846.1    </td><td>4395.612    </td><td>        NA  </td><td>          NA</td></tr>
	<tr><th scope=row>age</th><td> 1          </td><td>4778.3670   </td><td>271624.5    </td><td>4406.799    </td><td>13.0898906  </td><td>3.173322e-04</td></tr>
	<tr><th scope=row>dep.cons</th><td> 1          </td><td>9317.0855   </td><td>276163.2    </td><td>4419.112    </td><td>25.5232865  </td><td>5.526601e-07</td></tr>
	<tr><th scope=row>subst.cons</th><td> 1          </td><td>3333.6496   </td><td>270179.8    </td><td>4402.837    </td><td> 9.1322221  </td><td>2.599152e-03</td></tr>
	<tr><th scope=row>scz.cons</th><td> 1          </td><td> 352.8378   </td><td>267198.9    </td><td>4394.594    </td><td> 0.9665663  </td><td>3.258633e-01</td></tr>
	<tr><th scope=row>prof</th><td> 7          </td><td>2295.4642   </td><td>269141.6    </td><td>4387.976    </td><td> 0.8983157  </td><td>5.071556e-01</td></tr>
</tbody>
</table>



##### interaction entre 2 variables explicatives


```R
mod6=lm(dur.interv~age+dep.cons*subst.cons+scz.cons, data=data)
```


```R
summary(mod6)
```


​    
​    Call:
​    lm(formula = dur.interv ~ age + dep.cons * subst.cons + scz.cons, 
​        data = data)
​    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -62.032 -14.251  -1.163  11.472  62.313 
    
    Coefficients:
                        Estimate Std. Error t value Pr(>|t|)    
    (Intercept)         49.51693    2.65788  18.630  < 2e-16 ***
    age                  0.21728    0.05711   3.805 0.000154 ***
    dep.cons             6.15780    1.69775   3.627 0.000306 ***
    subst.cons           3.17244    2.29849   1.380 0.167931    
    scz.cons             1.97233    2.53094   0.779 0.436059    
    dep.cons:subst.cons  4.49688    3.24296   1.387 0.165963    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.08 on 741 degrees of freedom
      (52 observations deleted due to missingness)
    Multiple R-squared:  0.06077,	Adjusted R-squared:  0.05443 
    F-statistic: 9.588 on 5 and 741 DF,  p-value: 7.024e-09




```R
# attention, les effets des variables simples correspondantes
# ne peuvent pas être interprêtés !
```

### ANOVA = régression linéaire où les variables explicatives sont toutes catégorielles


```R
mod7=lm(dur.interv~prof, data=data) # exemple à 1 variable
```


```R
summary(mod7)
```


​    
​    Call:
​    lm(formula = dur.interv ~ prof, data = data)
​    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -61.731 -13.826  -1.731  12.947  58.912 
    
    Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
    (Intercept)             61.7315     1.3359  46.211   <2e-16 ***
    profagriculteur         17.0185     9.9071   1.718   0.0863 .  
    profartisan              2.0941     2.5033   0.837   0.4031    
    profautre                2.4993     4.0755   0.613   0.5399    
    profcadre               -4.7750     4.3063  -1.109   0.2679    
    profemploye              0.3220     2.1742   0.148   0.8823    
    profprof.intermediaire   1.3440     3.0096   0.447   0.6553    
    profsans emploi         -0.6432     1.9168  -0.336   0.7373    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 19.63 on 735 degrees of freedom
      (56 observations deleted due to missingness)
    Multiple R-squared:  0.008295,	Adjusted R-squared:  -0.001149 
    F-statistic: 0.8783 on 7 and 735 DF,  p-value: 0.5231



#### conditions de validité d'une régression linéaire
inclut la normalité du bruit, l'indépendance de la variance du bruit et l'absence de structure de corrélation évidente du bruit


```R
mod3=lm(dur.interv~age+dep.cons+subst.cons+scz.cons, data=data)
hist(resid(mod3), col='grey', main='')
```


![png](output_34_0.png)


#### regression logistique
lorsque la variable à expliquer est binaire

##### une régression linéaire va potentiellement entre -\infty et +\infty, e.g.
a + b \times duree + c \times abus + bruit

$$
\log[\frac{prob(HR suicide=oui)}{1-prob(HR suicide=oui)}] = a + b \times duree + c \times a
$$
bus


```R
#simplest example with 1 explicative variable
mod1 = glm(suicide.hr~abus, data=data, family='binomial')
```


```R
summary(mod1)
```


​    
​    Call:
​    glm(formula = suicide.hr ~ abus, family = "binomial", data = data)
​    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -0.8446  -0.6020  -0.6020  -0.6020   1.8959  
    
    Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  -1.6161     0.1154 -14.003  < 2e-16 ***
    abus          0.7688     0.1897   4.052 5.07e-05 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 760.21  on 752  degrees of freedom
    Residual deviance: 744.26  on 751  degrees of freedom
      (46 observations deleted due to missingness)
    AIC: 748.26
    
    Number of Fisher Scoring iterations: 4




```R
OR = exp(mod1$coefficients[2])
print(OR)
```

        abus 
    2.157143 



```R
library(Epi)
twoby2(1-data$suicide.hr, 1-data$abus)
```

    2 by 2 table analysis: 
    ------------------------------------------------------ 
    Outcome   : 0 
    Comparing : 0 vs. 1 
    
        0   1    P(0) 95% conf. interval
    0  63  90  0.4118    0.3366   0.4913
    1 147 453  0.2450    0.2122   0.2810
    
                                       95% conf. interval
                 Relative Risk: 1.6807    1.3276   2.1276
             Sample Odds Ratio: 2.1571    1.4873   3.1287
    Conditional MLE Odds Ratio: 2.1547    1.4577   3.1764
        Probability difference: 0.1668    0.0837   0.2525
    
                 Exact P-value: 1e-04 
            Asymptotic P-value: 1e-04 
    ------------------------------------------------------


#### régression logistique avec plusieurs variables explicatives


```R
mod2=glm(suicide.hr~abus+discip+duree, 
         data=data, family='binomial')
```


```R
print(summary(mod2))
```


    Call:
    glm(formula = suicide.hr ~ abus + discip + duree, family = "binomial", 
        data = data)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.3200  -0.6655  -0.6012  -0.4997   2.0700  
    
    Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
    (Intercept) -0.02462    0.49635  -0.050 0.960439    
    abus         0.62289    0.22764   2.736 0.006213 ** 
    discip       0.52809    0.23767   2.222 0.026287 *  
    duree       -0.39862    0.11723  -3.400 0.000673 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 555.94  on 549  degrees of freedom
    Residual deviance: 533.26  on 546  degrees of freedom
      (249 observations deleted due to missingness)
    AIC: 541.26
    
    Number of Fisher Scoring iterations: 4


​    


```R
# les variables sont codées binaire, avec un coeff de 0.622 pour abus,
# on se rapproche de 1=oui
# attention durée est codé de 1 à 5 (gradation)
```


```R
print(exp(coefficients(mod2)))
```

    (Intercept)        abus      discip       duree 
      0.9756803   1.8643147   1.6956873   0.6712485 



```R
# possibilité d'étudier les interactions (duree*discip)
drop1(mod1, .~., test='Chisq')
```


<table>
<thead><tr><th></th><th scope=col>Df</th><th scope=col>Deviance</th><th scope=col>AIC</th><th scope=col>LRT</th><th scope=col>Pr(&gt;Chi)</th></tr></thead>
<tbody>
	<tr><th scope=row>&lt;none&gt;</th><td>NA         </td><td>744.2597   </td><td>748.2597   </td><td>      NA   </td><td>         NA</td></tr>
	<tr><th scope=row>abus</th><td> 1         </td><td>760.2126   </td><td>762.2126   </td><td>15.95292   </td><td>6.49375e-05</td></tr>
</tbody>
</table>



##### conditions de validité (simplifiée)
\color{red}au moins 5-10 évènements par variable explicative


```R

```
