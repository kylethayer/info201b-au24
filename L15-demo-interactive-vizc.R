## First review of as.Date()

# to see official documentation of as.Date() in RStudio
# (note: official documentation is often hard to read)
?as.Date()


# example's that don't
#  "Dec. 6th, 2024"
#  "12/06/2024" (interprets which one is month,day,year wrong)

# example
date_1_text <- "2024/12/06"
date_1_date <- as.Date(date_1_text)

# as.Date removes the time if it's there
date_2_text <- "2024/12/06 3:42:00"
date_2_date <- as.Date(date_1_text)


##### DEMO of Plotly

library(ggplot2)

# first a ggplot graph
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# to make it interactive with plotly
# save it to a variable, then call ggplotly() on it
library(plotly)

my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplotly(my_chart)


# to change the tooltip text, add a "text" to aes
# ignore the warning
# and set ggplotly tooltip to be text
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ, 
    y = hwy,
    text = paste("Highway Mileage: ", hwy, "<br>",
                 "Displacement in Liters", displ)))

ggplotly(my_chart, tooltip="text")



# small multiple using facet_wrap(~category)
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ, 
    y = hwy,
    text = paste("Highway Mileage:", hwy, "<br>",
                 "Displacement in Liters:", displ, "<br>",
                 "Class:", class))) +
  facet_wrap(~class)

ggplotly(my_chart, tooltip="text")
