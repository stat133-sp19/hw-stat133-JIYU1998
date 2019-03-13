---
#title: 'make shots data script'
#discription: This script manipulates five players shot data and makes summary for them.
#input(s): stephen-curry.csv andre-iguodala.csv draymond-green.csv kevin-durant.csv klay-thompson.csv
#output(s): andre-iguodala-summary.txt,kevin-durant-summary.txt, etc. for all five players, combined shots-data.csv and summary
---

#  setwd("C:/Users/dell/Desktop/hw-stat133/workout01/data")
  curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
  iguodala = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
  green = read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
  durant = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
  thompson = read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
  
  
  curry$name = 'Stephen Curry'
  durant$name = 'Kevin Durant'
  green$name = 'Graymond Green'
  thompson$name = 'Klay Thompson'
  iguodala$name = 'Andre Iguodala'
  
  
  curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes' 
  curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no' 
  durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes' 
  durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no' 
  green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes' 
  green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no' 
  iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes' 
  iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no' 
  thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes' 
  thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no' 
  
  
  curry$minute = curry$period*12-curry$minutes_remaining
  durant$minute = durant$period*12-durant$minutes_remaining
  green$minute = green$period*12-green$minutes_remaining
  iguodala$minute = iguodala$period*12-iguodala$minutes_remaining
  thompson$minute = thompson$period*12-thompson$minutes_remaining
  
  sink(file  = '../output/andre-iguodala-summary.txt')
  summary(iguodala)
  sink()
  
  sink(file  = '../output/kevin-durant-summary.txt')
  summary(durant)
  sink()
  
  sink(file  = '../output/graymond-green-summary.txt')
  summary(green)
  sink()
  
  sink(file  = '../output/klay-thompson-summary.txt')
  summary(thompson)
  sink()
  
  sink(file  = '../output/stephen-curry-summary.txt')
  summary(curry)
  sink()
  
  write.csv(
    x = rbind(curry, durant, green, iguodala, thompson),
    file = '../data/shots-data.csv'  
  )
  
  sink(file  = '../output/shots-data-summary.txt')
  summary(rbind(curry, durant, green, iguodala, thompson))
  sink()
  

  
  
    

  

  