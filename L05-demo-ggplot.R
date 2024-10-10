library("ggplot2")

midwest <- midwest

#scatter plot of points with x/y axis based on college degrees
# and poverty
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty))

# bar charts often have categories for the x axis
# so make a bar chart of population total per county
ggplot(midwest) +
  geom_col(aes(x = county, y = poptotal))
  
# There were too many counties, I'll just get the first few
# to make it legible, using the head() function
partial_midwest <- midwest |> head()

ggplot(partial_midwest) +
  geom_col(aes(x = county, y = poptotal))


# color scatterplot based on state
#scatter plot of points with x/y axis based on college degrees
# and poverty
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, 
                           y = percadultpoverty,
                           color = state))

# histogram
ggplot(midwest, aes(x = poptotal)) +
  geom_histogram(binwidth = 100000)

# histogram
ggplot(midwest, aes(x = poptotal, fill=state)) +
  geom_histogram(binwidth = 100000)

### labels using the labs() function
# histogram
ggplot(midwest, aes(x = poptotal, fill=state)) +
  geom_histogram(binwidth = 100000) +
  labs(
    title="Histogram of population per county",
    y = "Number of counties",
    x = "Total population in county",
    fill = "State"
  )
