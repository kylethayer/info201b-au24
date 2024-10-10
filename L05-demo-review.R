# Load fake student data
fake_student_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/demo_L03_fake_students.csv")

# load dplyr library
library("dplyr")

fake_student_df

pull(fake_student_df, student_num)
pull(fake_student_df, final_exam_score)

# pipe (|>, or %>%) takes the result to the left, 
# and puts it as the first thing in the function to the right
fake_student_df |> pull(student_num)
fake_student_df |> pull(final_exam_score)

# multistep pipe to find averages
fake_student_df |> 
  pull(student_num) |> 
  mean()

fake_student_df |> 
  pull(final_exam_score) |> 
  mean(na.rm = TRUE)

mean(72, 93, 87, 0, 54)
