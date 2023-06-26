install.packages("cowplot")

# make the list of all prediction models
aa<- list(rsfG111,rsflg100,rsflg010,rsflg001) 

for(i in 1:3){
  set.seed(1000)
  Brierr_P1 <- pec(aa,
                   formula=Hist(time,status) ~ 1,
                   data=RFS_P1_2,
                   splitMethod="bootcv",
                   M=round(NROW(inerror)*0.632),
                   B=100,
                   cens.model="marginal",
                   cause=i)
  assign(paste("BriP1",i,sep = "_"),Brierr_P1)
}
aa<- list(rsfG111,rsflg100,rsflg010,rsflg001)


# Visualizing Error Metrics in Plots
# Below, 'P1' is a data frame that consolidates the Bootstrap Cross-Validation Errors (BootCvErr) for PDO, Injury, and Fatal severity levels.
#*******PDO Error:******************
tiff("C:/Users/PDO_Error.tiff", units="in", width=6, height=6, res=300) # Replace with Your Own Folder Path and Save As Name
p1_1<- p1
p1_1<- p1_1[-c(30,60,90,120),]
BR1<-ggplot(p1_1, aes(x=V1, y=value, colour=Forest, shape= Forest))+
  labs(x = "Year", y = "Prediction Error")+
  geom_line()+ geom_point(size=2)+ 
  scale_color_brewer(palette = "Set1",labels = expression(RSF[111]^G,
                                                          RSF[100]^lg,
                                                          RSF["010"]^lg,
                                                          RSF["001"]^lg))+
  scale_shape(labels = expression(RSF[111]^G,
                                  RSF[100]^lg,
                                  RSF["010"]^lg,
                                  RSF["001"]^lg))+ theme_light()+
  theme(legend.text = element_text( size=18,face="bold"))+
  theme(legend.title = element_text( size=18,face="bold"))+
  ggtitle("")

dev.off()

#************************************
#*******Injury Error:******************
tiff("C:/Users/Injury_Error.tiff", units="in", width=6, height=6, res=300) # Replace with Your Own Folder Path and Save As Name
p2_1<- p2[-c(30,60,90,120),]
BR2<-ggplot(p2_1, aes(x=V1, y=value, colour=variable, shape= variable))+
  labs(x = "Year", y = "Prediction Error")+
  geom_line()+ geom_point(size=2)+ 
  scale_color_brewer(palette = "Set1",labels = expression(RSF[111]^G,
                                                          RSF[100]^lg,
                                                          RSF["010"]^lg,
                                                          RSF["001"]^lg))+
  scale_shape(labels = expression(RSF[111]^G,
                                  RSF[100]^lg,
                                  RSF["010"]^lg,
                                  RSF["001"]^lg))+ theme_light()+
  ggtitle("")

dev.off()

#************************************
#*******Fatal Error:******************
tiff("C:/Users/Fatal_Error.tiff", units="in", width=6, height=6, res=300) # Replace with Your Own Folder Path and Save As Name

p3_1<- p3[-c(30,60,90,120),]
BR3<-ggplot(p3_1, aes(x=V1, y=value, colour=variable, shape= variable))+
  labs(x = "Year", y = "Prediction Error")+
  geom_line()+ geom_point(size=2)+ 
  scale_color_brewer(palette = "Set1",labels = expression(RSF[111]^G,
                                                          RSF[100]^lg,
                                                          RSF["010"]^lg,
                                                          RSF["001"]^lg))+
  scale_shape(labels = expression(RSF[111]^G,
                                  RSF[100]^lg,
                                  RSF["010"]^lg,
                                  RSF["001"]^lg))+ theme_light()+
  ggtitle("")

dev.off()

# Creating the legend
#************************************
tiff("C:/Users/BR_Error2.tiff", units="in", width=9, height=9, res=700) # Replace with Your Own Folder Path and Save As Name

library("cowplot")
legend <- get_legend(BR1 + theme(legend.position='right'))
plot_grid(BR1+theme(legend.position='hidden'), 
          BR2+theme(legend.position='hidden'),
          BR3+theme(legend.position='hidden'), 
          legend, 
          labels = c("(a)","(b)","(c)"))
dev.off()





