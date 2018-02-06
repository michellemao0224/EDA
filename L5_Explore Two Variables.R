# Explore Two Variables
library(ggplot2) 
data(diamonds)
summary(diamonds)

# create a scatterplot of price vs x.
ggplot(aes(x = price, y = x), data = diamonds) +
  geom_point()

# correnlation between price and x
cor.test(diamonds$price, diamonds$x)
## 0.88

# correnlation between price and y
cor.test(diamonds$price, diamonds$y)
## 0.87

# correnlation between price and z
cor.test(diamonds$price, diamonds$z)
## 0.86

# Create a simple scatter plot of price vs depth.
ggplot(aes(x = price,y = depth), data = diamonds) +
  geom_point(alpha = 1/100) + 
  scale_x_continuous(limits=c(50, 70), breaks=seq(50, 70, 2)) +
  ylim(60, 64)

# correnlation between price and depth
cor.test(diamonds$price, diamonds$depth)
## -0.01

#Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.

ggplot(aes(x = price, y = carat), data = diamonds) +
  geom_point() +
  xlim(0, quantile(pf$price, 0.99)) +
  ylim(0, quantile(pf$carat, 0.99)) 

# Create a scatterplot of price vs. volume (x * y * z).
volume <- diamonds$x * diamonds$y * diamonds$z
head(volume)

ggplot(aes(x = price, y = x * y * z), data = diamonds) +
  geom_point()

# correnlation between price and volume
diamonds$volume <- subset(volume, volume != 0 && volume < 800)
cor.test(diamonds$price, diamonds$volume)
## 0.92

# Adjust the transparency of the
# points and add a linear model to the plot.
ggplot(aes(x = price, y = volume), data = diamonds) +
  ylim(0, 500) +
  geom_point(alpha = 1 / 100) +
  geom_smooth(method = 'lm', color = 'red')

# Mean price by Clarity
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
data(diamonds)

diamonds_by_clarity = group_by(diamonds, clarity)
diamonds_mp_by_clarity = summarise(diamonds_by_clarity,
                              mean_price = mean(price),
                              median_price = median(price),
                              min_price = min(price),
                              max_price = max(price),
                              n = n())
head(diamonds_mp_by_clarity)

# Bar charts of mean price
data(diamonds)
library(dplyr)

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

d1 <- ggplot(aes(x = clarity, y = mean_price), data = diamonds_mp_by_clarity) +
  geom_bar(stat='identity')
d2 <- ggplot(aes(x = color, y = mean_price), data = diamonds_mp_by_color) +
  geom_bar(stat = 'identity')

library(gridExtra)
grid.arrange(d1, d2, ncol = 1)
## Observations: mean price tends to decrease as clarity improve; the same can be said for color.
## Look at mean price across cut.