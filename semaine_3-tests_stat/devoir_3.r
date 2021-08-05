
data <- read.csv2('../data//satisfaction_hopital.csv')

str(data)

data$sexe <- factor(data$sexe, levels=c(0,1), labels=c('M', 'F')) # coding acc. data description

data$recommander.b <- ifelse(data$recommander==2, 1, 0) # si la variable recommander vaut 2,
                                    # le variable binaire recommander.b vaudra 1, sinon 0

table(data$recommander.b, data$sexe, deparse.level = 2, useNA = 'always') # juste pour vérifier
                    # visuellement à quoi on doit s'attendre en terme d'association des variables
                    # et en nombre d'observations. La tendance est la même dans les 2 cat sexe

prop.table(table(data$recommander.b, data$sexe, deparse.level = 2, useNA = 'always'), 
          margin=2) # tendance se confirmant avec un tableau des fréquences

results_fisher <- fisher.test(data$recommander.b, data$sexe)

results_fisher$estimate # l'odds ratio est très proche de 1, on a donc la même réparition 
        # de la variable recommander.b dans les 2 gorupes de sexe

results_fisher$conf.int # et son IC contient bien 1.00, 
                    # ainsi les 2 variables ne sont pas indépendantes

plot(jitter(data$score.relation), jitter(data$age)) # visualisation rapide pour avoir une idée
            # à première vue il n'y pas de corrélation évidente...

# afin de pouvoir utiliser le test de Pearson, un des échantillons doivent suivre
# une loi normale
hist(data$age) # ça à l'air 'normale'

cor.test(data$score.relation, data$age, use='complete.obs') # mais avec un P > 0.05, le test de
    # nullité du coefficient cor nous indique qu'on ne peut pas rejeter H0
    # ainsi il peut ne pas y avoir de corrélation entre ces 2 variables

# ici nous devons tester si la variance est équivalente pour les 2 groupes
by(data$score.relation, data$sexe, var, na.rm=TRUE) # l'écart entre les variances est minime, OK

boxplot(score.relation~sexe, data=data) # jetons un oeil avisé à la répartition des données

t.test(data$score.relation~data$sexe, var.equal = TRUE)

# ceci conclut notre devoir, ici largement P>0.05, on ne rejette donc pas H0 et on peut
# affirmer qu'il n'y a pas de différence entre les moyennes. Bye_
