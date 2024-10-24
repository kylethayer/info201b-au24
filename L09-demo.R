# Demo read file from computer

# NOTE: THESE PROBABLY WONT WORK ON YOUR COMPUTER
# Since you will have files in different locations than I do

okcupid_df <- 
  read.csv("C:/code/classes/201/datasets/okcupid/profiles_revised.csv")


# see where my R code is running:
getwd()

# relative path from when I'm in this directory
# C:\code\classes\201\datasets\food desert

okcupid_df <- read.csv("../okcupid/profiles_revised.csv")

# set my R code to run in the C:/code/classes/201/datasets/okcupid directory
# so I can just load the file
setwd("C:/code/classes/201/datasets/okcupid")

getwd()

okcupid_df <- read.csv("profiles_revised.csv")


# I'm going to make a new directory with this R file and put a datafile
# in the same directory

#If I try just loading the file, it might not work
state_pop <- read.csv("NST-EST2020-POP.csv")
getwd()

# I can make my R code start running in the location of my R file by
# Session -> Set Working Directory -> To Source File Location
getwd()
state_pop <- read.csv("NST-EST2020-POP.csv")

read.csv("1979-2022-National-Park-Visits-By-State.csv")
