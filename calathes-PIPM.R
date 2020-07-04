library(tidyverse)
library(cowplot)
library(ggrepel)
library(ggimage)
library(ggforce)
library(extrafont)

#Nick Calathes Career PIPM
dat<-data.frame(pipm=c(-0.55,+0.45,+1.32,+3.13,0,+0.9,+2.98,+1.62,+4.84,+1.11,+0.94),
                opipm=c(-0.62,-0.15,+0.87,+1.35,-1.4,-1.8,+0.18,+0.10,+3.41,+0.05,+1.64),
                dpipm=c(+0.07,+0.60,+0.45,+1.79,+1.4,+2.7,+2.80,+1.52,+1.44,+1.06,-0.70),
                year=2010:2020)
dat$image <-c(rep("C:\\logos\\nick.png",5),
              rep("C:\\logos\\el.png",6))
# 2010-2012 pao , 2013 loko , 2014-15 grizzlies , 2016-20 pao


colors <- c("PIPM" = "forestgreen","OPIPM" = "royalblue2","DPIPM" = "goldenrod2")
g<- ggplot(data = dat, aes(x = year)) +
  geom_point(data = dat, aes(x = year, y = pipm),size = 1.8, color="forestgreen")+
  geom_point(data = dat, aes(x = year, y = opipm),size = 1.8, color="royalblue2")+
  geom_point(data = dat, aes(x = year, y = dpipm),size = 1.8, color="goldenrod2")+
  geom_hline(yintercept=0, color="white",linetype = "dashed")+
  geom_line(aes(y = pipm, color = "PIPM"))+
  geom_line(aes(y = opipm, color = "OPIPM"))+
  geom_line(aes(y = dpipm, color = "DPIPM"))+
  scale_x_continuous(name ="Year", 
                     breaks=2010:2020)+
  geom_ellipse(aes(x0 = 2011, y0 = 0.3, a =2 , b =1 , angle = pi / 4),color="lightgreen")+
  annotate(geom = "text", x = 2009.5, y =2.1, label = "2009-2012: \nFirst PAO tenure",
           hjust = "left", color='lightgreen',family="Century",
           fontface= "bold") +
  geom_ellipse(aes(x0 = 2013, y0 = 2.2, a =2 , b =0.3 , angle = pi/2),color="firebrick")+
  annotate(geom = "text", x = 2011, y =4.1, label = "2013: \nLokomotiv Kuban",
           hjust = "left", color='firebrick1',family="Century",
           fontface= "bold") +
  annotate(geom = "text", x = 2013.8, y =2.1, label = "2014-15: \nMemphis Grizzlies",
           hjust = "left", color='lightcyan3',angle=35,family="Century",
           fontface="bold") +
  annotate(geom = "text", x = 2015.8, y =4.1, label = "2016-20: \nSecond PAO tenure",
           hjust = "left", color='lightgreen',family="Century",
           fontface= "bold") +
  labs(title="Multi-Year PIPM",
       subtitle="Nick Calathes",
       caption = "Source: @JacobEGoldstein",y="",colour="") +
  scale_color_manual(values = colors)+
  theme_black()
   
png("nick_pipm.png", units="in", width=10, height=7, res=500)
ggdraw(g) + 
  draw_image(dat$image[1], x = 1, y = 1, hjust = 1, 
             vjust = 1, width = 0.13, height = 0.2)
dev.off()




