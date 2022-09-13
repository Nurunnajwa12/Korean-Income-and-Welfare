
# KOREAN INCOME AND WELFARE DATA ANALYSYS#

library(readxl)

install.packages("cli")
library(cli)
library("scales") 
library("stringr") 
library("Hmisc") 
library("forcats") 
library("ggthemes") 

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

#H0 = The average income of each group is same.
#H1 = The average income for each group is different.

inc <- Korea$income
gend<- Korea$gender
  t.test(inc~gend,var.equal=FALSE)

table(gend)
summary(gend)

ggplot(data=Korea,mapping=aes(x=gend, y=inc)) +
  stat_summary(fun.data=mean_sdl, geom="bar",fill="lightblue")+labs(title="Mean of Income between Gender", x="Gender", y="Income")

#Conclusion
# t 0.025,920 = 1.96
#Since t0= 0.347 is less than 1.96, we fail to reject the H0 at significant level, 0.05.
#There is no sufficient evidence that mean income of male is different from mean income of female.

#--------------------------------------------------------------------------------------------------------#

#Correlation test
#Using Pearson correlation method
#Family members and income

#H0= No linear correlation
#H1= Linear correlation exist
x = Korea$family_member
y = Korea$income

cor.test(x,y, method=c("pearson"))

#Second scatter plot
  plot(x,y, xlim=c(0,10),ylim=c(100,25000),xlab="Family Member", ylab="Income(KRW)",col="lightblue",
       main= "Correlation between family member and income(won)")

#regression line
  model<-lm(y~x)
  model
  abline(model)
  
# Conclusion
# r=0.267 ->relatively weak positive linear relationship between family members and income.

#------------------------------------------------------------------------------------------
  
#Chi Square Independent Test
#Variable:Educational Level and Marriage
  
#H0= Educational Level and marriage are independent
#H1= Educational level and marriage are dependent

  dataFrame <- with(Korea,table(education_level,marriage))
  print(dataFrame)
  
  Education_Marriage <- matrix(dataFrame, ncol=2,nrow=8)
rownames(Education_Marriage)<- c("College","Degree","Doctoral Degree","Elementary",
                                 "High school","Master","Middle school","No education")
colnames(Education_Marriage)<-c("Married","Not Married")
print(Education_Marriage)


mosaicplot(Education_Marriage,xlab="Education",ylab="Marital Status",
           main="Dependency between edu and marital status",border="black",color="skyblue2")


#First Method to do Chi Square Test
model<- chisq.test(Education_Marriage)
print(model)

#Second Method to do Chi Square Test
model2<- as.table(Education_Marriage)
summary(model2)

#Data Visualization


# Conclusion
# Since p-value <0.05, we reject H0 at significant level of 0.05.
# There is sufficient evidence that educational level not independent to marriage

#--------------------------------------------------------#
#Regression Test 
#Variables : Year born and Income

# Independent var = year born
# Dependent = income
# Change in income are assumed to be caused by changes in year born
 
year <- Korea$year_born
income <- Korea$income

model<-lm(income~year)
print(model)

# No year born has 0 year, b0 = -88674.14 is the portion of income not explained by year born.
# b1 = 45.73 tell us that average income increases by 45.73 won, for each additional one year born.

#Plot scatterplot
plot(year,income,xlim = c(min(year),2000),ylim = c(500,max(income)),
     ylab = "Income (Won)",xlab = "Year Born",col = "skyblue2",
     main = "Income versus Year-Born")
abline(model)
summary(model)

# Conclusion
# R squared = 0.078 (between 0 and 1)
# Therefore, weaker linear relationship between income and year born.
# Some but not all of the value of income explained by yea born.
# 7.8% of the variation in income explained by variation in year born.

# Is there a linear relationship between income and year born?
# H0: B1=0
# H1: B1 !=0
# Since B1=45.728, linear relationship does exist.
