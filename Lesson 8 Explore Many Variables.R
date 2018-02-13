# Explore Many Variables
library(ggplot2) 
data(diamonds)
summary(diamonds)

# Price Histograms with Facet and Color
ggplot(aes(x = price),
       data = diamonds) +
  ylim(0, 600) +
  facet_wrap( ~ color) +
  geom_histogram()
  scale_fill_brewer(type = 'qual')
 
# Price vs. Table Colored by Cut
ggplot(aes(x = table, y = price),
         data = diamonds) +
  geom_point(aes(color = cut), stat = 'summary')
  scale_fill_brewer(type = 'qual')
  
# Price vs. Volume and Diamond Clarity
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z
head(diamonds$volume)
  
ggplot(aes(x = volume, y = price), data = diamonds) +
    geom_point(aes(color = clarity))
    scale_fill_brewer(type = 'div')
  