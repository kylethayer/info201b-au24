# Demo 2.2, R code in R studio

# Load a dataset of the top 5 national parks by visits
np_top_5_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/refs/heads/main/2020-National-Park-Visits-By-State-Top5.csv")

np_top_5_df

summary(np_top_5_df)


# example functions
sum(2, 2)

sum(1, 2, 3, 4, 5)

seq(3, 10)

# just for fun, use one function inside another
# get 1-10 using seq(), and then sum() to add it up
seq(1,10)
sum(seq(1,10))

# example operators
2+2

1 + 2 + 3 + 4 + 5

32 / 4

# conditional operators
# is 1 bigger than 2?
1 > 2

# is 2 bigger than 1?
2 > 1

# is 2 the same as 2
2 == 2

# Demo variables
my_var <- 6

# how many minutes in a year?
years <- 1
days <- years * 365
hours <- days * 24
minutes <- hours * 60

# how about 2 years?
years <- 2
days <- years * 365
hours <- days * 24
minutes <- hours * 60

