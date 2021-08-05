### EXERCICE 1
# les fichiers ont été téléchargés dans ../data/
data <- read.csv2('c:/Python_DataScience/biostatistics/introduction_statistique_R_(FUN)/data/satisfaction_hopital.csv')

# les variables (service, sexe, profession) sont les trois variables catégorielles codées

# le pourcentage de sujets dans les différents catégories de la variable service est
tab.service <- table(data$service) # on ne prend pas en compte les valeurs manquantes
tab.service/sum(tab.service) * 100

# le pourcentage de sujets dans les différents catégories de la variable sexe est
tab.sexe <- table(data$sexe) # on ne prend pas en compte les valeurs manquantes
tab.sexe/sum(tab.sexe) * 100

# le pourcentage de sujets dans les différents catégories de la variable profession est
tab.prof <- table(data$prof) # on ne prend pas en compte les valeurs manquantes
tab.prof/sum(tab.prof) * 100

### EXERCICE 2
# il est nécessaire d'importer le module prettyR
library(prettyR)

describe(data$age, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
describe(data$amelioration.sante, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
describe(data$amelioration.moral, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
describe(data$recommander, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
describe(data$score.relation, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
describe(data$score.information, num.desc=c('mean', 'median', 'sd', 'min', 'max', 'valid.n'))
# NB sous python et pandas j'aurais d'abord créé une dataframe contenant chaque série des variables
# quantitatives, puis réalisé un unique describe. Je ne sais pas comment faire cela ni les boucles avec R...

### EXERCICE 3
# personnellement dans le cas présent je pense que montrer une barre pour chaque score est utile
hist(data$score.relation, main='répartition du score de relation',
    xlab='score de relation', ylab="nombre d'observations", nclass=(40-13),
    col='yellow', border="black", labels=TRUE)

# un peu de personnalisation en plus des
# reflexes essentiels tels que nommer les axes et donner un titre au graphique

### EXERCICE 4
boxplot(data$score.relation~factor(
    data$sexe, labels=c('M', 'F') # factorisation du paramètre sexe
), xlab='sexe', ylab='score de relation', main='distribution du score de relation en fonction du sexe',
        medianLwd=10, col=c('blue', 'red'), na.rm=TRUE) # et personnalisation

### FIN