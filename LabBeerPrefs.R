# Title:  LabBeerPrefs.R
# 13 nov 2020
# Author: Tim Assal
# script to create visualize our beer preferences
# also, we'll use this as part of the example repo on github (everyone will pull it down and add their beer prefs)

#load the packages you'll need
#REMEMBER to install them first if you haven't used them before
library(tidyverse)
library(wesanderson) #load the Wes Anderson Color package
#I know the guy (Karthik) who create this package. He's a strange dude; but I like Wes Anderson movies. 


##########
# 1. Rank you beer prefence #7 is your favorite, #1 is your least favorite
##########
Beer.Type<- c('Pilsner','IPA','Porter', 'Stout', 'Wild/Sour', 'Pale', 'Wheat')
Tim <- c(5, 6, 3, 1, 2, 7, 4)
#Lab.mascot <- c(1, 2, 4, 5, 6, 7, 3)
#add your name and beer preferences here:

###########
###########

###########
# 2. Add your name in the line of code below
#compile into a data frame
df<- data.frame(Beer.Type, Tim)
###########
###########

###########
# 3. Run the rest of the code - the code SHOULD be robust to handle the additional names
#reshape the dataframe for the plot
df2<-df%>%
  gather(key = "Lab.Member", value="Beer.Preference",-Beer.Type) 
head(df2)

#create plot 1
p1<-ggplot(data=df2, aes(Beer.Type, Beer.Preference, fill = Lab.Member)) +
  geom_bar(position = "dodge", stat = "identity", alpha=1) +
  scale_fill_manual(values=wes_palette("Zissou1"))+ #use the Zissou theme
  ylab("Least Favorite     <-------------   Beer Preference   ------------>      Favorite") + xlab("Beer Type") + 
  theme_bw()
#plot(p1)
#remove y-axis tick labels and rename legend
p1B<-p1+theme(axis.text.y=element_blank())+ guides(fill=guide_legend(title="Lab Member"))
plot(p1B)
ggsave("Figures/LabBeerPrefs.jpg", p1B, width = 18.5, height=14, units=c("cm"), dpi = 300)
###########
###########

###########
# 4. Take it a step further
## take it a step further and add the lab logo and Duff beer image to the graph
#load additional libraries
library(cowplot)
library(magick)

#Nick - do you prefer the duff logo or lab logo?

#run the code below
ggdraw() +
  draw_plot(p1B)+
  draw_image("SourceData/bld-logo.jpg",  x = 0.385, y = 0.4, scale = .2) +
  draw_image("SourceData/Duff_beer.jpg",  x = 0.385, y = -0.3, scale = .2) 

ggsave("Figures/LabBeerPrefsLogo.jpg", width = 18.5, height=14, units=c("cm"), dpi = 300)
###########
###########

#!!!!!!!!!!!
# Check your figures directory; it should have updated your name to the figure list
# Now push the repo back up to github
# !!!!!!!!!!
