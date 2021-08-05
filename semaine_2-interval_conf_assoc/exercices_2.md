
#### exercice 1


```R
a <- c('A','B','C','A','B','D', 'A')
```


```R
which(a=='A')
```


<ol class=list-inline>
	<li>1</li>
	<li>4</li>
	<li>7</li>
</ol>



#### exercice 2


```R
barplot(table(a))
```


![png](exercices_2_files/exercices_2_4_0.png)


#### exercice 4


```R
data <- read.csv2('../data/smp2.csv')
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
    

Quel est le nombre moyen d'enfants (variable n.enfant) chez les individus diagnostiqués comme dépressifs (dep.cons = 1) (2 chiffres après la virgule) ?


```R
round(mean(subset(data, dep.cons == 1, n.enfant)$n.enfant, na.rm=TRUE), digits = 2)
```


1.76


#### exercice 5

Donner la borne supérieure de l'intervalle interquartile pour la variable duree chez les individus dont l'âge est strictement inférieur à 35 ans (2 chiffres après la virgule).


```R
summary(data$age)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
       19.0    28.0    37.0    38.9    48.0    83.0       2 



```R
quantile(data$age, na.rm=TRUE)[4]
```


<strong>75%:</strong> 48



```R
round(
    quantile(
        subset(
            data, age < 35, duree
        ), na.rm=TRUE
    )[4],
    digits=2)
```


<strong>75%:</strong> 5



```R
#quantile(smp$duree[smp$age < 35], na.rm = TRUE)
#ou
#summary(smp$duree[smp$age < 35], na.rm = TRUE)
#ou
#quantile(smp$duree[smp$age < 35], na.rm = TRUE, probs = .75)
```

#### exercice 6

Nous souhaitons estimer la durée moyenne d'intervention (dur.interv) chez les individus ayant au moins un antécédent de tentative de suicide (suicide.past = 1). Quelle commande pouvons-nous utiliser ?


```R
mean(
subset(data, suicide.past >= 1, dur.interv)$dur.interv, na.rm=TRUE)
```


67.3507109004739



```R
mean(data[data$suicide.past == 1, 'dur.interv'], na.rm=TRUE)
```


67.3507109004739



```R
 mean(data$dur.interv[data$suicide.past == 1])
```


&lt;NA&gt;


#### exercice 7

À partir du data frame smp, nous souhaitons recoder l’âge (variable age) en variable catégorielle en considérant 4 intervalles de classe dont les bornes intermédiaires sont définies à partir des 1er, 2ème et 3ème quartiles.

Les bornes inférieures et supérieures de la première et dernière classe seront naturellement les valeurs minimale et maximale observées pour la variable age. À l'exception de la première classe dont les deux bornes d'intervalle seront fermées (c'est-à-dire que les bornes seront inclues dans l'intervalle), les bornes inférieures des classes suivantes (2 à 4) seront ouvertes, et les bornes supérieures fermées. Indiquer l'effectif associé à la 3ème classe ainsi constituée.


```R
summary(data$age)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
       19.0    28.0    37.0    38.9    48.0    83.0       2 



```R
min(data$age, na.rm=TRUE)
```


19



```R
length(data$age) / 4
```


199.75



```R
help(length)
```


```R
summary(data$age)
data$age.cat <- cut(data$age, breaks = c(19, 28, 37, 48, 83), include.lowest = TRUE)
table(data$age.cat)
```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
       19.0    28.0    37.0    38.9    48.0    83.0       2 



    
    [19,28] (28,37] (37,48] (48,83] 
        212     190     209     186 


##### SECTION 2 bis

Nous supposons que nous disposons d'une variable numérique x, sans données manquantes, dont nous souhaitons représenter la distribution sous forme d'histogramme d'effectifs constitué de 6 classes d'intervalles. Quelle commande pouvons nous utiliser ?


```R
hist(data$age, breaks=6)
```


![png](exercices_2_files/exercices_2_30_0.png)



```R
help(hist)
```

Pour afficher un tableau de fréquences relatives d'une variable qualitative z (sans données manquantes), nous utilisons la commande


```R
prop.table(table(data$age))
```


    
             19          20          21          22          23          24 
    0.018820577 0.018820577 0.022584693 0.016311167 0.028858218 0.037641154 
             25          26          27          28          29          30 
    0.027603513 0.037641154 0.031367629 0.026348808 0.025094103 0.031367629 
             31          32          33          34          35          36 
    0.022584693 0.027603513 0.032622334 0.025094103 0.020075282 0.022584693 
             37          38          39          40          41          42 
    0.031367629 0.030112923 0.028858218 0.027603513 0.028858218 0.023839398 
             43          44          45          46          47          48 
    0.021329987 0.023839398 0.021329987 0.020075282 0.015056462 0.021329987 
             49          50          51          52          53          54 
    0.028858218 0.020075282 0.013801757 0.012547051 0.010037641 0.013801757 
             55          56          57          58          59          60 
    0.007528231 0.017565872 0.011292346 0.008782936 0.007528231 0.008782936 
             61          62          63          64          65          66 
    0.006273526 0.008782936 0.005018821 0.006273526 0.003764115 0.007528231 
             67          68          69          70          71          72 
    0.005018821 0.002509410 0.001254705 0.001254705 0.007528231 0.003764115 
             73          74          77          79          81          83 
    0.002509410 0.002509410 0.003764115 0.001254705 0.001254705 0.002509410 


Existe-t-il des données manquantes parmi les individus dont les n° d'observation (n° de ligne dans le data frame smp) sont les suivants : 20, 221, 342, 446, 531.


```R
str(data[c(20,221,342,446,531),])
```

    'data.frame':	5 obs. of  27 variables:
     $ age         : int  28 57 37 51 51
     $ prof        : Factor w/ 8 levels "agriculteur",..: 6 8 8 6 2
     $ duree       : int  5 5 4 3 5
     $ discip      : int  0 0 0 0 0
     $ n.enfant    : int  1 2 1 1 4
     $ n.fratrie   : int  1 2 2 3 5
     $ ecole       : int  2 2 1 3 1
     $ separation  : int  0 0 1 0 0
     $ juge.enfant : int  0 0 0 0 0
     $ place       : int  0 0 0 0 0
     $ abus        : int  0 1 0 0 1
     $ grav.cons   : int  2 5 1 2 6
     $ dep.cons    : int  0 1 0 0 1
     $ ago.cons    : int  0 0 0 0 0
     $ ptsd.cons   : int  0 0 0 0 0
     $ alc.cons    : int  0 0 0 0 0
     $ subst.cons  : int  1 0 0 0 0
     $ scz.cons    : int  0 0 0 0 1
     $ char        : int  1 2 1 1 2
     $ rs          : int  2 1 1 2 3
     $ ed          : int  2 3 2 2 3
     $ dr          : int  2 3 2 2 3
     $ suicide.s   : int  0 4 0 0 3
     $ suicide.hr  : int  0 1 0 0 1
     $ suicide.past: int  1 1 0 0 0
     $ dur.interv  : int  95 50 30 85 68
     $ age.cat     : Factor w/ 4 levels "[19,28]","(28,37]",..: 1 4 2 4 4
    


```R
summary(data[c(20,221,342,446,531),])
```


          age                prof       duree         discip     n.enfant  
     Min.   :28.0   ouvrier    :2   Min.   :3.0   Min.   :0   Min.   :1.0  
     1st Qu.:37.0   sans emploi:2   1st Qu.:4.0   1st Qu.:0   1st Qu.:1.0  
     Median :51.0   artisan    :1   Median :5.0   Median :0   Median :1.0  
     Mean   :44.8   agriculteur:0   Mean   :4.4   Mean   :0   Mean   :1.8  
     3rd Qu.:51.0   autre      :0   3rd Qu.:5.0   3rd Qu.:0   3rd Qu.:2.0  
     Max.   :57.0   cadre      :0   Max.   :5.0   Max.   :0   Max.   :4.0  
                    (Other)    :0                                          
       n.fratrie       ecole       separation   juge.enfant     place  
     Min.   :1.0   Min.   :1.0   Min.   :0.0   Min.   :0    Min.   :0  
     1st Qu.:2.0   1st Qu.:1.0   1st Qu.:0.0   1st Qu.:0    1st Qu.:0  
     Median :2.0   Median :2.0   Median :0.0   Median :0    Median :0  
     Mean   :2.6   Mean   :1.8   Mean   :0.2   Mean   :0    Mean   :0  
     3rd Qu.:3.0   3rd Qu.:2.0   3rd Qu.:0.0   3rd Qu.:0    3rd Qu.:0  
     Max.   :5.0   Max.   :3.0   Max.   :1.0   Max.   :0    Max.   :0  
                                                                       
          abus       grav.cons      dep.cons      ago.cons   ptsd.cons    alc.cons
     Min.   :0.0   Min.   :1.0   Min.   :0.0   Min.   :0   Min.   :0   Min.   :0  
     1st Qu.:0.0   1st Qu.:2.0   1st Qu.:0.0   1st Qu.:0   1st Qu.:0   1st Qu.:0  
     Median :0.0   Median :2.0   Median :0.0   Median :0   Median :0   Median :0  
     Mean   :0.4   Mean   :3.2   Mean   :0.4   Mean   :0   Mean   :0   Mean   :0  
     3rd Qu.:1.0   3rd Qu.:5.0   3rd Qu.:1.0   3rd Qu.:0   3rd Qu.:0   3rd Qu.:0  
     Max.   :1.0   Max.   :6.0   Max.   :1.0   Max.   :0   Max.   :0   Max.   :0  
                                                                                  
       subst.cons     scz.cons        char           rs            ed     
     Min.   :0.0   Min.   :0.0   Min.   :1.0   Min.   :1.0   Min.   :2.0  
     1st Qu.:0.0   1st Qu.:0.0   1st Qu.:1.0   1st Qu.:1.0   1st Qu.:2.0  
     Median :0.0   Median :0.0   Median :1.0   Median :2.0   Median :2.0  
     Mean   :0.2   Mean   :0.2   Mean   :1.4   Mean   :1.8   Mean   :2.4  
     3rd Qu.:0.0   3rd Qu.:0.0   3rd Qu.:2.0   3rd Qu.:2.0   3rd Qu.:3.0  
     Max.   :1.0   Max.   :1.0   Max.   :2.0   Max.   :3.0   Max.   :3.0  
                                                                          
           dr        suicide.s     suicide.hr   suicide.past   dur.interv  
     Min.   :2.0   Min.   :0.0   Min.   :0.0   Min.   :0.0   Min.   :30.0  
     1st Qu.:2.0   1st Qu.:0.0   1st Qu.:0.0   1st Qu.:0.0   1st Qu.:50.0  
     Median :2.0   Median :0.0   Median :0.0   Median :0.0   Median :68.0  
     Mean   :2.4   Mean   :1.4   Mean   :0.4   Mean   :0.4   Mean   :65.6  
     3rd Qu.:3.0   3rd Qu.:3.0   3rd Qu.:1.0   3rd Qu.:1.0   3rd Qu.:85.0  
     Max.   :3.0   Max.   :4.0   Max.   :1.0   Max.   :1.0   Max.   :95.0  
                                                                           
        age.cat 
     [19,28]:1  
     (28,37]:1  
     (37,48]:0  
     (48,83]:3  
                
                
                



```R
sum(is.na(data[c(20,221,342,446,531),]))
```


0


Quelle est la proportion relative d'individus (exprimée en %) sans emploi parmi l'ensemble des 799 individus (2 chiffres après la virgule)?


```R
sum(table(data$prof, useNA = 'always'))
```


799



```R
prop.table(table(data$prof, useNA = 'always'))
```


    
           agriculteur            artisan              autre              cadre 
           0.007509387        0.112640801        0.038798498        0.030037547 
               employe            ouvrier prof.intermediaire        sans emploi 
           0.168961202        0.284105131        0.072590738        0.277847309 
                  <NA> 
           0.007509387 



```R
prop.table(table(data$prof, useNA = 'always'))['sans emploi']
```


<strong>sans emploi:</strong> 0.277847309136421



```R
round(prop.table(table(data$prof, useNA = 'always'))['sans emploi'] * 100, 2)
```


<strong>sans emploi:</strong> 27.78


Combien d'individus ont un âge compris entre 20 et 30 ans, inclus ?


```R
nrow(subset(data, age >= 20 & age <= 30))
```


242



```R
data$age
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
	<li>31</li>
	<li>&lt;NA&gt;</li>
	<li>21</li>
	<li>40</li>
	<li>64</li>
	<li>67</li>
	<li>60</li>
	<li>63</li>
	<li>&lt;NA&gt;</li>
	<li>28</li>
	<li>20</li>
	<li>30</li>
	<li>32</li>
	<li>31</li>
	<li>26</li>
	<li>42</li>
	<li>32</li>
	<li>40</li>
	<li>41</li>
	<li>27</li>
	<li>24</li>
	<li>38</li>
	<li>39</li>
	<li>36</li>
	<li>29</li>
	<li>41</li>
	<li>36</li>
	<li>41</li>
	<li>21</li>
	<li>21</li>
	<li>46</li>
	<li>22</li>
	<li>21</li>
	<li>35</li>
	<li>45</li>
	<li>38</li>
	<li>19</li>
	<li>21</li>
	<li>27</li>
	<li>40</li>
	<li>39</li>
	<li>47</li>
	<li>24</li>
	<li>36</li>
	<li>39</li>
	<li>22</li>
	<li>38</li>
	<li>37</li>
	<li>29</li>
	<li>23</li>
	<li>36</li>
	<li>42</li>
	<li>56</li>
	<li>28</li>
	<li>36</li>
	<li>38</li>
	<li>43</li>
	<li>29</li>
	<li>64</li>
	<li>25</li>
	<li>51</li>
	<li>35</li>
	<li>30</li>
	<li>37</li>
	<li>26</li>
	<li>36</li>
	<li>58</li>
	<li>32</li>
	<li>30</li>
	<li>26</li>
	<li>27</li>
	<li>23</li>
	<li>24</li>
	<li>39</li>
	<li>43</li>
	<li>39</li>
	<li>26</li>
	<li>44</li>
	<li>37</li>
	<li>40</li>
	<li>24</li>
	<li>46</li>
	<li>26</li>
	<li>38</li>
	<li>37</li>
	<li>30</li>
	<li>39</li>
	<li>36</li>
	<li>39</li>
	<li>28</li>
	<li>27</li>
	<li>51</li>
	<li>48</li>
	<li>47</li>
	<li>41</li>
	<li>35</li>
	<li>25</li>
	<li>31</li>
	<li>44</li>
	<li>40</li>
	<li>29</li>
	<li>34</li>
	<li>49</li>
	<li>57</li>
	<li>33</li>
	<li>35</li>
	<li>32</li>
	<li>34</li>
	<li>46</li>
	<li>45</li>
	<li>31</li>
	<li>42</li>
	<li>48</li>
	<li>34</li>
	<li>34</li>
	<li>64</li>
	<li>50</li>
	<li>53</li>
	<li>49</li>
	<li>53</li>
	<li>37</li>
	<li>42</li>
	<li>55</li>
	<li>32</li>
	<li>33</li>
	<li>40</li>
	<li>29</li>
	<li>32</li>
	<li>23</li>
	<li>61</li>
	<li>39</li>
	<li>30</li>
	<li>37</li>
	<li>30</li>
	<li>39</li>
	<li>49</li>
	<li>44</li>
	<li>40</li>
	<li>56</li>
	<li>43</li>
	<li>27</li>
	<li>21</li>
	<li>44</li>
	<li>50</li>
	<li>50</li>
	<li>20</li>
	<li>37</li>
	<li>42</li>
	<li>27</li>
	<li>22</li>
	<li>25</li>
	<li>20</li>
	<li>21</li>
	<li>19</li>
	<li>25</li>
	<li>24</li>
	<li>49</li>
	<li>24</li>
	<li>26</li>
	<li>35</li>
	<li>22</li>
	<li>24</li>
	<li>23</li>
	<li>46</li>
	<li>26</li>
	<li>41</li>
	<li>51</li>
	<li>20</li>
	<li>30</li>
	<li>37</li>
	<li>49</li>
	<li>28</li>
	<li>28</li>
	<li>51</li>
	<li>40</li>
	<li>33</li>
	<li>25</li>
	<li>29</li>
	<li>40</li>
	<li>43</li>
	<li>35</li>
	<li>50</li>
	<li>44</li>
	<li>35</li>
	<li>24</li>
	<li>43</li>
	<li>26</li>
	<li>45</li>
	<li>42</li>
	<li>45</li>
	<li>48</li>
	<li>45</li>
	<li>34</li>
	<li>31</li>
	<li>40</li>
	<li>22</li>
	<li>42</li>
	<li>38</li>
	<li>38</li>
	<li>40</li>
	<li>46</li>
	<li>26</li>
	<li>29</li>
	<li>25</li>
	<li>40</li>
	<li>43</li>
	<li>28</li>
	<li>29</li>
	<li>32</li>
	<li>28</li>
	<li>57</li>
	<li>31</li>
	<li>71</li>
	<li>33</li>
	<li>24</li>
	<li>22</li>
	<li>25</li>
	<li>26</li>
	<li>52</li>
	<li>33</li>
	<li>38</li>
	<li>39</li>
	<li>41</li>
	<li>52</li>
	<li>33</li>
	<li>39</li>
	<li>59</li>
	<li>33</li>
	<li>50</li>
	<li>58</li>
	<li>23</li>
	<li>41</li>
	<li>43</li>
	<li>42</li>
	<li>22</li>
	<li>57</li>
	<li>41</li>
	<li>30</li>
	<li>66</li>
	<li>49</li>
	<li>46</li>
	<li>28</li>
	<li>59</li>
	<li>35</li>
	<li>44</li>
	<li>83</li>
	<li>34</li>
	<li>49</li>
	<li>60</li>
	<li>56</li>
	<li>46</li>
	<li>62</li>
	<li>41</li>
	<li>27</li>
	<li>53</li>
	<li>48</li>
	<li>66</li>
	<li>66</li>
	<li>55</li>
	<li>61</li>
	<li>43</li>
	<li>54</li>
	<li>38</li>
	<li>51</li>
	<li>51</li>
	<li>50</li>
	<li>56</li>
	<li>53</li>
	<li>49</li>
	<li>41</li>
	<li>44</li>
	<li>64</li>
	<li>42</li>
	<li>52</li>
	<li>72</li>
	<li>43</li>
	<li>30</li>
	<li>32</li>
	<li>43</li>
	<li>25</li>
	<li>27</li>
	<li>25</li>
	<li>52</li>
	<li>39</li>
	<li>42</li>
	<li>59</li>
	<li>46</li>
	<li>62</li>
	<li>50</li>
	<li>24</li>
	<li>43</li>
	<li>32</li>
	<li>67</li>
	<li>28</li>
	<li>44</li>
	<li>19</li>
	<li>20</li>
	<li>23</li>
	<li>26</li>
	<li>28</li>
	<li>31</li>
	<li>42</li>
	<li>57</li>
	<li>30</li>
	<li>36</li>
	<li>53</li>
	<li>33</li>
	<li>25</li>
	<li>22</li>
	<li>42</li>
	<li>25</li>
	<li>32</li>
	<li>23</li>
	<li>45</li>
	<li>48</li>
	<li>35</li>
	<li>37</li>
	<li>38</li>
	<li>24</li>
	<li>47</li>
	<li>61</li>
	<li>38</li>
	<li>27</li>
	<li>27</li>
	<li>26</li>
	<li>30</li>
	<li>47</li>
	<li>37</li>
	<li>30</li>
	<li>41</li>
	<li>29</li>
	<li>37</li>
	<li>28</li>
	<li>47</li>
	<li>26</li>
	<li>50</li>
	<li>23</li>
	<li>60</li>
	<li>37</li>
	<li>48</li>
	<li>41</li>
	<li>28</li>
	<li>54</li>
	<li>61</li>
	<li>33</li>
	<li>31</li>
	<li>25</li>
	<li>66</li>
	<li>26</li>
	<li>29</li>
	<li>29</li>
	<li>53</li>
	<li>24</li>
	<li>48</li>
	<li>40</li>
	<li>47</li>
	<li>40</li>
	<li>41</li>
	<li>54</li>
	<li>25</li>
	<li>36</li>
	<li>44</li>
	<li>32</li>
	<li>27</li>
	<li>31</li>
	<li>34</li>
	<li>34</li>
	<li>71</li>
	<li>20</li>
	<li>54</li>
	<li>39</li>
	<li>50</li>
	<li>36</li>
	<li>37</li>
	<li>43</li>
	<li>28</li>
	<li>21</li>
	<li>35</li>
	<li>36</li>
	<li>53</li>
	<li>36</li>
	<li>38</li>
	<li>66</li>
	<li>62</li>
	<li>38</li>
	<li>24</li>
	<li>49</li>
	<li>21</li>
	<li>34</li>
	<li>29</li>
	<li>36</li>
	<li>29</li>
	<li>33</li>
	<li>34</li>
	<li>57</li>
	<li>65</li>
	<li>25</li>
	<li>36</li>
	<li>31</li>
	<li>54</li>
	<li>49</li>
	<li>42</li>
	<li>30</li>
	<li>20</li>
	<li>23</li>
	<li>21</li>
	<li>23</li>
	<li>39</li>
	<li>45</li>
	<li>29</li>
	<li>21</li>
	<li>54</li>
	<li>77</li>
	<li>23</li>
	<li>32</li>
	<li>58</li>
	<li>49</li>
	<li>26</li>
	<li>40</li>
	<li>51</li>
	<li>62</li>
	<li>45</li>
	<li>41</li>
	<li>30</li>
	<li>52</li>
	<li>20</li>
	<li>36</li>
	<li>34</li>
	<li>35</li>
	<li>30</li>
	<li>46</li>
	<li>79</li>
	<li>66</li>
	<li>19</li>
	<li>41</li>
	<li>51</li>
	<li>26</li>
	<li>56</li>
	<li>33</li>
	<li>39</li>
	<li>72</li>
	<li>45</li>
	<li>59</li>
	<li>21</li>
	<li>41</li>
	<li>43</li>
	<li>55</li>
	<li>26</li>
	<li>49</li>
	<li>29</li>
	<li>26</li>
	<li>28</li>
	<li>77</li>
	<li>61</li>
	<li>63</li>
	<li>30</li>
	<li>49</li>
	<li>48</li>
	<li>45</li>
	<li>32</li>
	<li>56</li>
	<li>48</li>
	<li>64</li>
	<li>73</li>
	<li>33</li>
	<li>74</li>
	<li>54</li>
	<li>27</li>
	<li>49</li>
	<li>45</li>
	<li>27</li>
	<li>53</li>
	<li>62</li>
	<li>54</li>
	<li>37</li>
	<li>56</li>
	<li>60</li>
	<li>33</li>
	<li>34</li>
	<li>32</li>
	<li>44</li>
	<li>49</li>
	<li>46</li>
	<li>67</li>
	<li>39</li>
	<li>59</li>
	<li>63</li>
	<li>81</li>
	<li>38</li>
	<li>58</li>
	<li>42</li>
	<li>73</li>
	<li>48</li>
	<li>41</li>
	<li>28</li>
	<li>44</li>
	<li>45</li>
	<li>46</li>
	<li>50</li>
	<li>27</li>
	<li>56</li>
	<li>46</li>
	<li>42</li>
	<li>25</li>
	<li>23</li>
	<li>26</li>
	<li>19</li>
	<li>24</li>
	<li>24</li>
	<li>32</li>
	<li>23</li>
	<li>24</li>
	<li>33</li>
	<li>21</li>
	<li>33</li>
	<li>41</li>
	<li>24</li>
	<li>31</li>
	<li>19</li>
	<li>25</li>
	<li>51</li>
	<li>39</li>
	<li>22</li>
	<li>20</li>
	<li>30</li>
	<li>34</li>
	<li>28</li>
	<li>20</li>
	<li>20</li>
	<li>33</li>
	<li>24</li>
	<li>32</li>
	<li>37</li>
	<li>25</li>
	<li>24</li>
	<li>29</li>
	<li>19</li>
	<li>37</li>
	<li>56</li>
	<li>49</li>
	<li>60</li>
	<li>29</li>
	<li>22</li>
	<li>20</li>
	<li>49</li>
	<li>33</li>
	<li>30</li>
	<li>29</li>
	<li>25</li>
	<li>62</li>
	<li>41</li>
	<li>33</li>
	<li>44</li>
	<li>60</li>
	<li>24</li>
	<li>24</li>
	<li>33</li>
	<li>27</li>
	<li>45</li>
	<li>33</li>
	<li>44</li>
	<li>23</li>
	<li>23</li>
	<li>35</li>
	<li>36</li>
	<li>28</li>
	<li>24</li>
	<li>27</li>
	<li>27</li>
	<li>28</li>
	<li>27</li>
	<li>40</li>
	<li>52</li>
	<li>19</li>
	<li>31</li>
	<li>21</li>
	<li>33</li>
	<li>23</li>
	<li>30</li>
	<li>23</li>
	<li>31</li>
	<li>48</li>
	<li>24</li>
	<li>24</li>
	<li>26</li>
	<li>32</li>
	<li>29</li>
	<li>38</li>
	<li>23</li>
	<li>50</li>
	<li>26</li>
	<li>47</li>
	<li>38</li>
	<li>24</li>
	<li>24</li>
	<li>19</li>
	<li>25</li>
	<li>31</li>
	<li>33</li>
	<li>26</li>
	<li>38</li>
	<li>23</li>
	<li>37</li>
	<li>19</li>
	<li>49</li>
	<li>33</li>
	<li>30</li>
	<li>38</li>
	<li>30</li>
	<li>26</li>
	<li>27</li>
	<li>21</li>
	<li>31</li>
	<li>19</li>
	<li>26</li>
	<li>28</li>
	<li>49</li>
	<li>35</li>
	<li>25</li>
	<li>32</li>
	<li>27</li>
	<li>20</li>
	<li>30</li>
	<li>25</li>
	<li>21</li>
	<li>54</li>
	<li>27</li>
	<li>22</li>
	<li>39</li>
	<li>21</li>
	<li>54</li>
	<li>49</li>
	<li>23</li>
	<li>36</li>
	<li>59</li>
	<li>50</li>
	<li>24</li>
	<li>47</li>
	<li>42</li>
	<li>41</li>
	<li>33</li>
	<li>46</li>
	<li>23</li>
	<li>19</li>
	<li>39</li>
	<li>38</li>
	<li>40</li>
	<li>39</li>
	<li>40</li>
	<li>44</li>
	<li>26</li>
	<li>48</li>
	<li>47</li>
	<li>23</li>
	<li>25</li>
	<li>20</li>
	<li>45</li>
	<li>44</li>
	<li>57</li>
	<li>39</li>
	<li>55</li>
	<li>19</li>
	<li>34</li>
	<li>28</li>
	<li>33</li>
	<li>19</li>
	<li>33</li>
	<li>27</li>
	<li>46</li>
	<li>47</li>
	<li>22</li>
	<li>27</li>
	<li>26</li>
	<li>52</li>
	<li>56</li>
	<li>44</li>
	<li>63</li>
	<li>34</li>
	<li>41</li>
	<li>38</li>
	<li>37</li>
	<li>58</li>
	<li>37</li>
	<li>24</li>
	<li>60</li>
	<li>26</li>
	<li>21</li>
	<li>52</li>
	<li>20</li>
	<li>37</li>
	<li>32</li>
	<li>32</li>
	<li>58</li>
	<li>49</li>
	<li>32</li>
	<li>37</li>
	<li>46</li>
	<li>50</li>
	<li>44</li>
	<li>47</li>
	<li>37</li>
	<li>38</li>
	<li>50</li>
	<li>56</li>
	<li>30</li>
	<li>34</li>
	<li>43</li>
	<li>55</li>
	<li>43</li>
	<li>31</li>
	<li>55</li>
	<li>41</li>
	<li>68</li>
	<li>45</li>
	<li>48</li>
	<li>42</li>
	<li>71</li>
	<li>38</li>
	<li>46</li>
	<li>65</li>
	<li>51</li>
	<li>57</li>
	<li>57</li>
	<li>71</li>
	<li>40</li>
	<li>43</li>
	<li>71</li>
	<li>48</li>
	<li>34</li>
	<li>69</li>
	<li>43</li>
	<li>35</li>
	<li>62</li>
	<li>34</li>
	<li>51</li>
	<li>48</li>
	<li>36</li>
	<li>44</li>
	<li>49</li>
	<li>74</li>
	<li>19</li>
	<li>56</li>
	<li>57</li>
	<li>65</li>
	<li>52</li>
	<li>77</li>
	<li>29</li>
	<li>37</li>
	<li>45</li>
	<li>40</li>
	<li>72</li>
	<li>27</li>
	<li>56</li>
	<li>35</li>
	<li>30</li>
	<li>37</li>
	<li>30</li>
	<li>40</li>
	<li>54</li>
	<li>26</li>
	<li>48</li>
	<li>83</li>
	<li>32</li>
	<li>22</li>
	<li>48</li>
	<li>67</li>
	<li>58</li>
	<li>37</li>
	<li>24</li>
	<li>34</li>
	<li>39</li>
	<li>38</li>
	<li>39</li>
	<li>56</li>
	<li>35</li>
	<li>26</li>
	<li>70</li>
	<li>68</li>
	<li>42</li>
	<li>41</li>
	<li>40</li>
	<li>26</li>
	<li>50</li>
	<li>27</li>
	<li>28</li>
	<li>44</li>
	<li>31</li>
	<li>38</li>
	<li>71</li>
</ol>




```R

```
