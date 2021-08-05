
### importation des données dans R


```R
data<-read.csv2('../data/smp1.csv')
```

### exploration rapide des données


```R
head(data)
```


<table>
<thead><tr><th scope=col>age</th><th scope=col>prof</th><th scope=col>dep.cons</th><th scope=col>scz.cons</th><th scope=col>grav.cons</th><th scope=col>n.enfant</th><th scope=col>rs</th><th scope=col>ed</th><th scope=col>dr</th></tr></thead>
<tbody>
	<tr><td>31                </td><td>autre             </td><td>0                 </td><td>0                 </td><td>1                 </td><td>2                 </td><td>2                 </td><td>1                 </td><td>1                 </td></tr>
	<tr><td>49                </td><td>NA                </td><td>0                 </td><td>0                 </td><td>2                 </td><td>7                 </td><td>2                 </td><td>2                 </td><td>1                 </td></tr>
	<tr><td>50                </td><td>prof.intermediaire</td><td>0                 </td><td>0                 </td><td>2                 </td><td>2                 </td><td>2                 </td><td>3                 </td><td>2                 </td></tr>
	<tr><td>47                </td><td>ouvrier           </td><td>0                 </td><td>0                 </td><td>1                 </td><td>0                 </td><td>2                 </td><td>2                 </td><td>2                 </td></tr>
	<tr><td>23                </td><td>sans emploi       </td><td>1                 </td><td>0                 </td><td>2                 </td><td>1                 </td><td>2                 </td><td>2                 </td><td>2                 </td></tr>
	<tr><td>34                </td><td>ouvrier           </td><td>0                 </td><td>0                 </td><td>1                 </td><td>3                 </td><td>1                 </td><td>2                 </td><td>1                 </td></tr>
</tbody>
</table>




```R
str(data)
```

    'data.frame':	799 obs. of  9 variables:
     $ age      : int  31 49 50 47 23 34 24 52 42 45 ...
     $ prof     : Factor w/ 8 levels "agriculteur",..: 3 NA 7 6 8 6 3 2 6 6 ...
     $ dep.cons : int  0 0 0 0 1 0 1 0 1 0 ...
     $ scz.cons : int  0 0 0 0 0 0 0 0 0 0 ...
     $ grav.cons: int  1 2 2 1 2 1 5 1 5 5 ...
     $ n.enfant : int  2 7 2 0 1 3 5 2 1 2 ...
     $ rs       : int  2 2 2 2 2 1 3 2 3 2 ...
     $ ed       : int  1 2 3 2 2 2 3 2 3 2 ...
     $ dr       : int  1 1 2 2 2 1 2 2 1 2 ...
    


```R
table(data$prof)
```


    
           agriculteur            artisan              autre              cadre 
                     6                 90                 31                 24 
               employe            ouvrier prof.intermediaire        sans emploi 
                   135                227                 58                222 


### analyse qualitative visuelle


```R
barplot(table(data$prof))
```


![png](chap1-02_files/chap1-02_7_0.png)



```R
pie(table(data$prof))
```


![png](chap1-02_files/chap1-02_8_0.png)


### analyse quantitative visuelle


```R
hist(data$age,col="green",main="",xlab="age")
```


![png](chap1-02_files/chap1-02_10_0.png)



```R
boxplot(data$age~data$ed,ylab="age",xlab="évitement du danger",
       col=c('green', 'blue', 'red'))
```


![png](chap1-02_files/chap1-02_11_0.png)


### distribution de 2 variables


```R
plot(jitter(data$age),jitter(data$n.enfant),
    xlab='age', ylab="nombre d'enfants")
```


![png](chap1-02_files/chap1-02_13_0.png)


### analyse de l'autre jeu de données


```R
library(gplots) # import gplot lib
```


    Error in library(gplots): there is no package called 'gplots'
    Traceback:
    

    1. library(gplots)

    2. stop(txt, domain = NA)



```R
install.packages("gplots", repos='http://cran.us.r-project.org')
```

    Installing package into 'C:/R/library'
    (as 'lib' is unspecified)
    also installing the dependencies 'bitops', 'gtools', 'gdata', 'caTools'
    
    

    package 'bitops' successfully unpacked and MD5 sums checked
    package 'gtools' successfully unpacked and MD5 sums checked
    package 'gdata' successfully unpacked and MD5 sums checked
    package 'caTools' successfully unpacked and MD5 sums checked
    package 'gplots' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Sébastien\AppData\Local\Temp\Rtmp2ZtAOp\downloaded_packages
    


```R
library(gplots) # import gplot lib
```

    
    Attaching package: 'gplots'
    
    The following object is masked from 'package:stats':
    
        lowess
    
    


```R
repdat <- read.csv2('../data/outils_hdrs.csv')
```


```R
head(repdat)
```


<table>
<thead><tr><th scope=col>NUMERO</th><th scope=col>VISIT</th><th scope=col>HDRS</th></tr></thead>
<tbody>
	<tr><td>96</td><td> 0</td><td>34</td></tr>
	<tr><td>96</td><td> 4</td><td>26</td></tr>
	<tr><td>96</td><td> 7</td><td>12</td></tr>
	<tr><td>96</td><td>14</td><td> 7</td></tr>
	<tr><td>96</td><td>21</td><td> 5</td></tr>
	<tr><td>96</td><td>28</td><td> 1</td></tr>
</tbody>
</table>




```R
plotmeans(repdat$HDRS~repdat$VISIT,gap=0,barcol="black")
```

    Warning message in axis(1, at = 1:length(means), labels = legends, ...):
    ""gap" n'est pas un paramètre graphique"Warning message in plot.xy(xy.coords(x, y), type = type, ...):
    ""gap" n'est pas un paramètre graphique"


![png](chap1-02_files/chap1-02_20_1.png)



```R
interaction.plot(repdat$VISIT,repdat$NUMERO,repdat$HDRS,lty=1,legend=FALSE)
```


![png](chap1-02_files/chap1-02_21_0.png)



```R

```
