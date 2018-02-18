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
  
# Proportion of Friendships Initiated
library(ggplot2)
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
names(pf)

pf$prop_initiated <-  ifelse(pf$friend_count == 0, 0, pf$friendships_initiated / pf$friend_count)

# prop_initiated vs. tenure
ggplot(aes(x = tenure, y = prop_initiated), data = pf) +
  geom_line(aes(color = year_joined), stat = 'summary', fun.y = median)

# Smoothing prop_initiated vs. tenure
ggplot(aes(x = tenure, y = prop_initiated), data = pf) +
  geom_line(aes(color = year_joined), stat = 'summary', fun.y = median) +
  geom_smooth(method = 'lm', color = 'red')

# Price/Carat Binned, Faceted, & Colored
ggplot(aes(x = cut, y = price /  carat),
       data = diamonds) +
  facet_wrap( ~ clarity) +
  geom_point(aes(color = color), alpha = 1 / 20) + 
  scale_fill_brewer(type = 'div')
