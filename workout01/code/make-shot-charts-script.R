
#title: 'make shots charts script'
#discription: This script makes charts of five players' shot data. 
#input(s): ...
#output(s): ...

  
library(jpeg)

library(grid)

library(ggplot2)

#curry
# scatterplot
curry_scatterplot = ggplot(data = curry) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
curry_scatterplot
  
court_file = "../images/nba-court.jpg"
  
  
# create raste object
court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
  

# shot chart with court background
pdf(file = '../images/stephen-curry-shot-chart.pdf',width = 6.5, height = 5)
ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
dev.off()

#durant

# scatterplot
durant_scatterplot = ggplot(data = durant) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
durant_scatterplot


# shot chart with court background
pdf(file = '../images/kevin-durant-shot-chart.pdf',width = 6.5, height = 5)
ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

#green
# scatterplot
green_scatterplot = ggplot(data = green) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
green_scatterplot


# shot chart with court background
pdf(file = '../images/draymond-green-shot-chart.pdf',width = 6.5, height = 5)
ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()


#iguodala
iguodala_scatterplot = ggplot(data = iguodala) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))


# shot chart with court background
pdf(file = '../images/andre-iguodala-shot-chart.pdf',width = 6.5, height = 5)
ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()


#thompson
thompson_scatterplot = ggplot(data = thompson) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))


# shot chart with court background
pdf(file = '../images/klay-thompson-shot-chart.pdf',width = 6.5, height = 5)
ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
dev.off()



five_player = read.csv(file = '../data/shots-data.csv')
#4.2) Facetted Shot Chart
pdf(file = '../images/gsw-shot-charts.pdf',width = 8, height = 7)
ggplot(data = five_player) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()+
  facet_wrap(~name)+
  theme(legend.position = "top")
dev.off()


png(file = '../images/gsw-shot-charts.png')
ggplot(data = five_player) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()+
  facet_wrap(~name)+
  theme(legend.position = "top")
dev.off()




  
  