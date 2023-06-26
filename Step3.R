#Including 3 Sections*************************************************************************************************************************************

#Section 1: Variable Selection:
#VIMP:

library(ggRandomForests)
vimp<- gg_vimp(rsfG111)
vimp$set <- factor(vimp$set,
                   levels = c("event.1","event.2","event.3"),
                   labels = c("PDO", "Injury", "Fatal"))

#plot vimp
tiff("C:/Users/VIMPG111_2.tiff", units="in", width=7.5, height=6, res=300) #Replace "C:/Users/VIMPG111_2.tiff" with your desired file save path and name.


plot(vimp)+
  theme(legend.position = c(0.8, 0.2))+ 
  labs(fill = "VIMP > 0")

dev.off()


# Section 2: CIF Estimation and Visualization************************************************************************************************************
tiff("C:/Users/RFS_4.tiff",  units="in", width=12, height=13, res=700) #Replace "C:/Users/RFS_4.tiff" with your desired file save path and name.
#*****a
par(mfrow=c(2,2))
cif <- rsfG111$cif.oob

Time <- rsfG111$time.interest
idu <- RFS_P1_2$CrossCtrl
cif.PDO <- cbind(apply(cif[,,1][idu == 1,], 2, mean),
                 apply(cif[,,1][idu ==18,], 2, mean))
cif.Injury <- cbind(apply(cif[,,2][idu == 1,], 2, mean),
                    apply(cif[,,2][idu == 18,], 2, mean))
cif.Fatal <- cbind(apply(cif[,,3][idu == 1,], 2, mean),
                   apply(cif[,,3][idu == 18,], 2, mean))

matplot(Time, cbind(cif.PDO, cif.Injury,cif.Fatal), type = "l",
        lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), lwd = 2,
        ylab = "Probability(CIF)",xlab = "Year")
legend("topleft",
       legend = c("PDO:Gate",   "PDO:Crossbucks+StopSigns", 
                  "Injury:Gate","Injury:Crossbucks+StopSigns",
                  "Fatal:Gate", "Fatal:Crossbucks+StopSigns"),
       lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), 
       lwd = 1, cex = 0.7)
title("(a)",cex.main=2, adj=0,line = 1)

#b
a<- 12
b<- 10
cex=0.65
Dev1<- "Gates+StandardFLS+Audible+StopSigns"
Dev2<- "Gates+StandardFLS+Audible"


cif.PDO <- cbind(apply(cif[,,1][idu == a,], 2, mean),
                 apply(cif[,,1][idu ==b,], 2, mean))
cif.Injury <- cbind(apply(cif[,,2][idu == a,], 2, mean),
                    apply(cif[,,2][idu == b,], 2, mean))
cif.Fatal <- cbind(apply(cif[,,3][idu == a,], 2, mean),
                   apply(cif[,,3][idu == b,], 2, mean))

matplot(Time, cbind(cif.PDO, cif.Injury,cif.Fatal), type = "l",
        lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), lwd = 2,
        ylab = "Probability(CIF)",xlab = "Year")
legend("topleft",
       legend = c(paste("PDO",Dev1,sep = ":"),paste("PDO",Dev2,sep = ":"), 
                  paste("Injury",Dev1,sep = ":"),paste("Injury",Dev2,sep = ":"),
                  paste("Fatal",Dev1,sep = ":"), paste("Fatal",Dev2,sep = ":")),
       lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), 
       lwd = 1, cex = cex)
title("(b)",cex.main=2, adj=0,line = 1)
#c    

Time <- rsfG111$time.interest
idu <- RFS_P1_2$CrossCtrl
cif.PDO <- cbind(apply(cif[,,1][idu == 8,], 2, mean),
                 apply(cif[,,1][idu ==10,], 2, mean))
cif.Injury <- cbind(apply(cif[,,2][idu == 8,], 2, mean),
                    apply(cif[,,2][idu == 10,], 2, mean))
cif.Fatal <- cbind(apply(cif[,,3][idu == 8,], 2, mean),
                   apply(cif[,,3][idu == 10,], 2, mean))

matplot(Time, cbind(cif.PDO, cif.Injury,cif.Fatal), type = "l",
        lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), lwd = 2,
        ylab = "Probability(CIF)",xlab = "Year")
legend("topleft",
       legend = c("PDO:Gates+StandardFLS","PDO:Gates+StandardFLS+Audible", 
                  "Injury:Gates+StandardFLS","Injury:Gates+StandardFLS+Audible",
                  "Fatal:Gates+StandardFLS", "Fatal:Gates+StandardFLS+Audibles"),
       lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), 
       lwd = 1, cex = 0.66) 
title("(c)",cex.main=2, adj=0,line = 1)
#d      
a<- 14
b<- 8
cex=0.7
Dev1<- "StandardFLS"
Dev2<- "Gates+StandardFLS"

cif.PDO <- cbind(apply(cif[,,1][idu == a,], 2, mean),
                 apply(cif[,,1][idu ==b,], 2, mean))
cif.Injury <- cbind(apply(cif[,,2][idu == a,], 2, mean),
                    apply(cif[,,2][idu == b,], 2, mean))
cif.Fatal <- cbind(apply(cif[,,3][idu == a,], 2, mean),
                   apply(cif[,,3][idu == b,], 2, mean))

matplot(Time, cbind(cif.PDO, cif.Injury,cif.Fatal), type = "l",
        lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), lwd = 2,
        ylab = "Probability(CIF)",xlab = "Year")
legend("topleft",
       legend = c(paste("PDO",Dev1,sep = ":"),paste("PDO",Dev2,sep = ":"), 
                  paste("Injury",Dev1,sep = ":"),paste("Injury",Dev2,sep = ":"),
                  paste("Fatal",Dev1,sep = ":"), paste("Fatal",Dev2,sep = ":")),
       lty = c(1,2,1,2,1,2), col = c(4,4,"Orange","Orange", 2,2), 
       lwd = 1, cex = cex)
title("(d)",cex.main=2, adj=0,line = 1)
dev.off()

# Section 3: Estimating and Plotting Growth Ratio  for Traffic Control Devices Effects*********************************************************************
for(i in c(1,	4,6,8,9,10,12,14,18,19,25,26)){
  Dev_Code <- i
  PDO_1<- apply(cif[,,1][idu == Dev_Code,], 2, mean)
  PDO_1<- as.data.frame(PDO_1)
  Injury_1<- apply(cif[,,2][idu == Dev_Code,], 2, mean)
  Injury_1<- as.data.frame(Injury_1)
  Fatal_1<- apply(cif[,,3][idu == Dev_Code,], 2, mean)
  Fatal_1<- as.data.frame(Fatal_1)
  
  for(j in 2:length(PDO_1$PDO_1)){
    PDO_1$PDO_Ratio[1]<- 0
    PDO_1$PDO_Ratio[j]<- PDO_1$PDO_1[j]-PDO_1$PDO_1[j-1]
    Injury_1$Inj_Ratio[1]<- 0
    Injury_1$Inj_Ratio[j]<- Injury_1$Injury_1[j]-Injury_1$Injury_1[j-1]
    Fatal_1$Fat_Ratio[1]<- 0
    Fatal_1$Fat_Ratio[j]<- Fatal_1$Fatal_1[j]-Fatal_1$Fatal_1[j-1]
  }
  
  RPDO_1<- (mean(PDO_1[c(2:29),2]))*100
  Rinj_1<- (mean(Injury_1[c(2:29),2]))*100
  RFat_1<- (mean(Fatal_1[c(2:29),2]))*100
  
  DV<- cbind(Dev_Code,RPDO_1,Rinj_1,RFat_1) 
  assign(paste("DV", Dev_Code, sep = "_"), DV )
  
}

