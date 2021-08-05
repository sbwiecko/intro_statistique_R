

```R
data<-c(1,2,3,4,5,6)
```


```R
mean(data)
```


3.5



```R
sd(data)
```


1.87082869338697



```R
var(data)
```


3.5



```R
sqrt(var(data))
```


1.87082869338697



```R
IQR(data)
```


2.5



```R
install.packages("prettyR", repos='http://cran.us.r-project.org')
library(prettyR)
describe(data)
```

    Installing package into 'C:/R/library'
    (as 'lib' is unspecified)


    package 'prettyR' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Sébastien\AppData\Local\Temp\RtmpUfPFPb\downloaded_packages
    Description of data 




     Numeric 
               mean median    var    sd valid.n
    age       38.90     37 176.38 13.28     797
    dep.cons   0.40      0   0.24  0.49     799
    scz.cons   0.08      0   0.08  0.28     799
    grav.cons  3.64      4   2.73  1.65     795
    n.enfant   1.76      1   3.36  1.83     773
    rs         2.06      2   0.77  0.88     696
    ed         1.87      2   0.76  0.87     692
    dr         2.15      2   0.69  0.83     688
    
     Factor 
             
    prof      ouvrier sans emploi employe artisan prof.intermediaire autre cadre
      Count    227.00      222.00   135.0   90.00              58.00 31.00    24
      Percent   28.41       27.78    16.9   11.26               7.26  3.88     3
             
    prof      agriculteur <NA>
      Count          6.00 6.00
      Percent        0.75 0.75
    Mode ouvrier 



```R
describe(data, num.desc=c(
    'mean', 'sd', 'median', 'min', 'max', 'valid.n')) # additional/other parameters
```

    Description of data 




     Numeric 
               mean    sd median min max valid.n
    age       38.90 13.28     37  19  83     797
    dep.cons   0.40  0.49      0   0   1     799
    scz.cons   0.08  0.28      0   0   1     799
    grav.cons  3.64  1.65      4   1   7     795
    n.enfant   1.76  1.83      1   0  13     773
    rs         2.06  0.88      2   1   3     696
    ed         1.87  0.87      2   1   3     692
    dr         2.15  0.83      2   1   3     688
    
     Factor 
             
    prof      ouvrier sans emploi employe artisan prof.intermediaire autre cadre
      Count    227.00      222.00   135.0   90.00              58.00 31.00    24
      Percent   28.41       27.78    16.9   11.26               7.26  3.88     3
             
    prof      agriculteur <NA>
      Count          6.00 6.00
      Percent        0.75 0.75
    Mode ouvrier 



```R
summary(data)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
       1.00    2.25    3.50    3.50    4.75    6.00 


### loading of the csv


```R
data<-read.csv2('../data/smp1.csv')
```


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
data[1:2,1:5]
```


<table>
<thead><tr><th scope=col>age</th><th scope=col>prof</th><th scope=col>dep.cons</th><th scope=col>scz.cons</th><th scope=col>grav.cons</th></tr></thead>
<tbody>
	<tr><td>31   </td><td>autre</td><td>0    </td><td>0    </td><td>1    </td></tr>
	<tr><td>49   </td><td>NA   </td><td>0    </td><td>0    </td><td>2    </td></tr>
</tbody>
</table>




```R
summary(data)
```


          age                       prof        dep.cons         scz.cons     
     Min.   :19.0   ouvrier           :227   Min.   :0.0000   Min.   :0.0000  
     1st Qu.:28.0   sans emploi       :222   1st Qu.:0.0000   1st Qu.:0.0000  
     Median :37.0   employe           :135   Median :0.0000   Median :0.0000  
     Mean   :38.9   artisan           : 90   Mean   :0.3967   Mean   :0.0826  
     3rd Qu.:48.0   prof.intermediaire: 58   3rd Qu.:1.0000   3rd Qu.:0.0000  
     Max.   :83.0   (Other)           : 61   Max.   :1.0000   Max.   :1.0000  
     NA's   :2      NA's              :  6                                    
       grav.cons        n.enfant            rs              ed       
     Min.   :1.000   Min.   : 0.000   Min.   :1.000   Min.   :1.000  
     1st Qu.:2.000   1st Qu.: 0.000   1st Qu.:1.000   1st Qu.:1.000  
     Median :4.000   Median : 1.000   Median :2.000   Median :2.000  
     Mean   :3.643   Mean   : 1.755   Mean   :2.057   Mean   :1.866  
     3rd Qu.:5.000   3rd Qu.: 3.000   3rd Qu.:3.000   3rd Qu.:3.000  
     Max.   :7.000   Max.   :13.000   Max.   :3.000   Max.   :3.000  
     NA's   :4       NA's   :26       NA's   :103     NA's   :107    
           dr       
     Min.   :1.000  
     1st Qu.:1.000  
     Median :2.000  
     Mean   :2.153  
     3rd Qu.:3.000  
     Max.   :3.000  
     NA's   :111    



```R
mean(data$age, na.rm=TRUE) # remove NaN
```


38.8996235884567



```R
# in R, categorical variables are called Factors
table(data$prof, deparse.level=2, useNA='always')
```


    data$prof
           agriculteur            artisan              autre              cadre 
                     6                 90                 31                 24 
               employe            ouvrier prof.intermediaire        sans emploi 
                   135                227                 58                222 
                  <NA> 
                     6 



```R
names(data)
```


<ol class=list-inline>
	<li>'age'</li>
	<li>'prof'</li>
	<li>'dep.cons'</li>
	<li>'scz.cons'</li>
	<li>'grav.cons'</li>
	<li>'n.enfant'</li>
	<li>'rs'</li>
	<li>'ed'</li>
	<li>'dr'</li>
</ol>




```R
table(data$n.enfant > 4)
```


​    
    FALSE  TRUE 
      715    58 



```R
unique(data$prof)
```


<ol class=list-inline>
	<li>autre</li>
	<li>&lt;NA&gt;</li>
	<li>prof.intermediaire</li>
	<li>ouvrier</li>
	<li>sans emploi</li>
	<li>artisan</li>
	<li>employe</li>
	<li>agriculteur</li>
	<li>cadre</li>
</ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>'agriculteur'</li>
		<li>'artisan'</li>
		<li>'autre'</li>
		<li>'cadre'</li>
		<li>'employe'</li>
		<li>'ouvrier'</li>
		<li>'prof.intermediaire'</li>
		<li>'sans emploi'</li>
	</ol>
</details>



```R
table(data$prof, deparse.level=2, useNA='always')
```


    data$prof
           agriculteur            artisan              autre              cadre 
                     6                 90                 31                 24 
               employe            ouvrier prof.intermediaire        sans emploi 
                   135                227                 58                222 
                  <NA> 
                     6 



```R
factor(data$abus, levels=c(0,1), labels=c("Non", "Oui"))
# levels and labels associated to categorical values
```



<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>'Non'</li>
		<li>'Oui'</li>
	</ol>
</details>



```R
abus <- factor(data$abus)
```


```R
table(abus)
```


    < table of extent 0 >



```R
hist(data$age, nclass=8, prob=TRUE, las=1) # probabilty and regular axes
```


![png](chap1-03_files/chap1-03_23_0.png)



```R

```
