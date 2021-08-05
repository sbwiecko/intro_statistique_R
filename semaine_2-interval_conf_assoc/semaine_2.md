
### confidence interval


```R
install.packages("binom", repos='http://cran.us.r-project.org')
```

    Installing package into 'C:/R/library'
    (as 'lib' is unspecified)
    

    package 'binom' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Sébastien\AppData\Local\Temp\RtmpiOFd5f\downloaded_packages
    


```R
library(binom)
```


```R
binom.confint(3, 10, method="all")
```


<table>
<thead><tr><th scope=col>method</th><th scope=col>x</th><th scope=col>n</th><th scope=col>mean</th><th scope=col>lower</th><th scope=col>upper</th></tr></thead>
<tbody>
	<tr><td>agresti-coull</td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.10333842   </td><td>0.6076747    </td></tr>
	<tr><td>asymptotic   </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.01597423   </td><td>0.5840258    </td></tr>
	<tr><td>bayes        </td><td>3            </td><td>10           </td><td>0.3181818    </td><td>0.07454423   </td><td>0.5794516    </td></tr>
	<tr><td>cloglog      </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.07113449   </td><td>0.5778673    </td></tr>
	<tr><td>exact        </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.06673951   </td><td>0.6524529    </td></tr>
	<tr><td>logit        </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.09976832   </td><td>0.6236819    </td></tr>
	<tr><td>probit       </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.08991347   </td><td>0.6150429    </td></tr>
	<tr><td>profile      </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.08470272   </td><td>0.6065091    </td></tr>
	<tr><td>lrt          </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.08458545   </td><td>0.6065389    </td></tr>
	<tr><td>prop.test    </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.08094782   </td><td>0.6463293    </td></tr>
	<tr><td>wilson       </td><td>3            </td><td>10           </td><td>0.3000000    </td><td>0.10779127   </td><td>0.6032219    </td></tr>
</tbody>
</table>




```R
binom.confint(300, 1000, method="all")
```


<table>
<thead><tr><th scope=col>method</th><th scope=col>x</th><th scope=col>n</th><th scope=col>mean</th><th scope=col>lower</th><th scope=col>upper</th></tr></thead>
<tbody>
	<tr><td>agresti-coull</td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2723966    </td><td>0.3291341    </td></tr>
	<tr><td>asymptotic   </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2715974    </td><td>0.3284026    </td></tr>
	<tr><td>bayes        </td><td>300          </td><td>1000         </td><td>0.3001998    </td><td>0.2719448    </td><td>0.3286787    </td></tr>
	<tr><td>cloglog      </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2718595    </td><td>0.3285966    </td></tr>
	<tr><td>exact        </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2717211    </td><td>0.3294617    </td></tr>
	<tr><td>logit        </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2723865    </td><td>0.3291466    </td></tr>
	<tr><td>probit       </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2722277    </td><td>0.3289871    </td></tr>
	<tr><td>profile      </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2721340    </td><td>0.3288893    </td></tr>
	<tr><td>lrt          </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2721419    </td><td>0.3289000    </td></tr>
	<tr><td>prop.test    </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2719222    </td><td>0.3296354    </td></tr>
	<tr><td>wilson       </td><td>300          </td><td>1000         </td><td>0.3000000    </td><td>0.2724068    </td><td>0.3291239    </td></tr>
</tbody>
</table>



### correlation


```R
data <- read.csv2('../data/smp1.csv')
```


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
plot(jitter(data$age),
    jitter(data$n.enfant))
```


![png](semaine_2_files/semaine_2_8_0.png)



```R
cor(data$age, data$n.enfant, use = 'complete.obs')
```


0.43260389564375



```R
# Le pourcentage de variance partagé entre ces 2 variables est de 0.4326**2, soit
.4326**2
```


0.18714276


### relative risk and odds-ratio


```R
install.packages("Epi", repos='http://cran.us.r-project.org')
```

    Installing package into 'C:/R/library'
    (as 'lib' is unspecified)
    also installing the dependencies 'RcppArmadillo', 'cmprsk', 'etm', 'numDeriv', 'data.table', 'zoo'
    
    

    package 'RcppArmadillo' successfully unpacked and MD5 sums checked
    package 'cmprsk' successfully unpacked and MD5 sums checked
    package 'etm' successfully unpacked and MD5 sums checked
    package 'numDeriv' successfully unpacked and MD5 sums checked
    package 'data.table' successfully unpacked and MD5 sums checked
    package 'zoo' successfully unpacked and MD5 sums checked
    package 'Epi' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Sébastien\AppData\Local\Temp\RtmpiOFd5f\downloaded_packages
    


```R
library(Epi)
```


    Error in library(Epi): there is no package called 'Epi'
    Traceback:
    

    1. library(Epi)

    2. stop(txt, domain = NA)



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
data$ed.b <- ifelse(data$ed >2, 1, 0)
```


```R
table(data$ed.b, data$ed)
```


       
          1   2   3
      0 315 155   0
      1   0   0 222



```R
library(Epi)
```


```R
twoby2(1 - data$ed.b, 1 - data$dep.cons)
```

    2 by 2 table analysis: 
    ------------------------------------------------------ 
    Outcome   : 0 
    Comparing : 0 vs. 1 
    
        0   1    P(0) 95% conf. interval
    0 126  96  0.5676    0.5016   0.6312
    1 135 335  0.2872    0.2481   0.3298
    
                                       95% conf. interval
                 Relative Risk: 1.9760    1.6456   2.3726
             Sample Odds Ratio: 3.2569    2.3361   4.5408
    Conditional MLE Odds Ratio: 3.2508    2.3037   4.6035
        Probability difference: 0.2803    0.2020   0.3549
    
                 Exact P-value: 0 
            Asymptotic P-value: 0 
    ------------------------------------------------------
    


```R

```
