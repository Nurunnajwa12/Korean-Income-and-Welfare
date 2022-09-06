library(readxl)
Korea_Income_Clean <- read_excel("~/01_Data Engineering/Semester 2/SECI2143/Project 2 STILL LIFE/Data_Project2/Korea-Income-Clean.xlsx")
View(Korea_Income_Clean)

library(readxl)
Korea <- read_excel("~/01_Data Engineering/Semester 2/SECI2143/Project 2 STILL LIFE/Data_Project2/Korea-Income-Clean.xlsx")
View(Korea)


install.packages("dplyr")
library(dplyr)

#Have a quick look
glimpse(Korea)

#summary
summary(Korea)
summary(Korea$income)

#-------------------------------------------------------------------------------------------------------#

#T test (two sample)
#Gender and Income
#Null hypothesis = The average income of each group is same.
#Alternative hypothesis = The average income for each group is different.

Korea %>%
  t.test(income~gender, data=.,var.equal=FALSE)

y=Korea$income
x=Korea$family_member
cor(x,y)

#--------------------------------------------------------------------------------------------------------#
#Correlation test
#Using Pearson correlation method
#Family members and income
cor.test(x,y, method=c("pearson"))

#scatter plot
install.packages(ggplot2)
  Korea%>%
    ggplot(aes(x,y,colour="blue")+
    geom_point()+
    geom_smooth(method=lm,
                se=F)+
    labs(x="Family Members",
         y="Income",
         title="Correlation between income and family members")+
    theme_minimal()
  
  #Second scatter plot
  plot(x,y, xlim=c(0,10),ylim=c(100,25000),xlab="Family Member", ylab="Income(KRW)")

  #regression line
  model<-lm(y~x)
  model
  abline(model)
           
#------------------------------------------------------------------------------------------
  
#Chi Square Goodness of Fit Test
#Variable:Educational Level
#H0= The proportion between each educational level are same
#H1= The proportion between each educational level are different

  edu <- Korea %>%
    mutate(size= cut(income,
                     breaks= 8,
                     labels= c("College","Degree","Doctoral Degree","Elementary",
                               "High school","Master","Middle school","No education")))
    select(education_level, size)
  
  table(edu)

  # Second Chi Square
           
  edu2<- table(Korea$education_level)
  
  el <- matrix(edu2,nrow = 1,ncol=8)
  colnames(el) <- c("College","Degree","Doctoral Degree","Elementary",
                       "High school","Master","Middle school","No education")
  rownames(el) <- "Frequency"
  print(el)
  
