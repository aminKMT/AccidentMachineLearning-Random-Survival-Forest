# Installing and loading packages
# packages list:
packages <- c("pec", "rms", "riskRegression", "party", "Hmisc",
              "dynpred", "survival", "prodlim", "CompR", "randomForestSRC",
              "reshape2", "expss", "ggRandomForests", "cowplot")

# Executing a Function to install and load packages:
install_load <- function(packages) {
  for(package in packages) {
    if (!require(package, character.only = TRUE)) {
      install.packages(package, dependencies = TRUE)
      library(package, character.only = TRUE)
    }
  }
}

# Using the function:
install_load(packages)


# Replace input1 with your own data set...
#WG(1,1,1)
input1<- StudyData
set.seed(3300)
rsfG111<- rfsrc(Surv(time,status) ~ .,
                data=input1,
                nsplit = 10,
                ntree = 1000,
                splitrule = "logrankCR",
                cause = c(1,1,1),importance = TRUE)



#lg100:
input1<- StudyData
set.seed(3300)
rsflg100<- rfsrc(Surv(time,status) ~ .,
                 data=input1,
                 nsplit = 10,
                 ntree = 1000,
                 splitrule = "logrank",
                 cause = c(1,0,0),importance = TRUE)
#lg(0,1,0)
input1<- StudyData
set.seed(3300)
rsflg010<- rfsrc(Surv(time,status) ~ .,
                 data=input1,
                 nsplit = 10,
                 ntree = 1000,
                 splitrule = "logrank",
                 cause = c(0,1,0),importance = TRUE)
#lg(0,0,1)
input1<- StudyData
set.seed(3300)
rsflg001<- rfsrc(Surv(time,status) ~ .,
                 data=input1,
                 nsplit = 10,
                 ntree = 1000,
                 splitrule = "logrank",
                 cause = c(0,0,1),importance = TRUE)

set.seed(1000)
Brierrg001 <- pec(list(rsflg001),
                  formula=Hist(time,status) ~ 1,
                  data=StudyData,
                  eval.times=seq(1:29),
                  splitMethod="bootcv",
                  M=round(NROW(inerror)*0.66),
                  B=5,
                  cens.model="marginal",
                  cause=1)
