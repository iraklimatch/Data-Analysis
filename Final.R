## Final Project

#Cleaning up the data

Newdata <- studentdata[1:1000, ]
write.csv(Newdata, "newstudentdata.csv", row.names = FALSE)

selected_variables <- newstudentdata[, c("Marital status", "Application mode", "Previous qualification", 
                          "Previous qualification (grade)", "Daytime/evening attendance\t", 
                          "Age at enrollment", "Target")]
names(newstudentdata)

selected_variables <- newstudentdata[, c("Marital.status", "Application.mode", "Previous.qualification", 
                                         "Previous.qualification..grade.", "Daytime.evening.attendance.", 
                                         "Age.at.enrollment", "Gender", "Target")]

write.csv(selected_variables, "clean_newstudentdata.csv", row.names = FALSE)


#Conduct Descriptive Statistics

mydata <- clean_newstudentdata

##frequencies and percentages marital status, application mode, previous qualification,
## Daytime/evening attendance, Gender, Target (outcome)


library(tableone)
freq_and_perc <- c("Marital.status", "Application.mode", "Previous.qualification", 
                   "Daytime.evening.attendance.", "Gender", "Target")
table = CreateCatTable(vars = freq_and_perc, data = mydata)
print(table, showAllLevels = TRUE)

#means and medians

library(psych)
DescFull <- describe(mydata)
View(DescFull)

plot(clean_newstudentdata$Target)


###Conduct Inferential Statistics

#Chi Square test for independence for marital status and academic success

MarSuc = chisq.test(clean_newstudentdata$Marital.status, clean_newstudentdata$Target)
MarSuc
MarSuc$expected
MarSuc$observed
MarSuc$residuals

#One way Anova for previous qualification grades among different Student Outcomes

library(psych)
describeBy(mydata$Previous.qualification..grade., group = mydata$Target)

library(ggplot2)
lineind <- ggplot(mydata, aes(x = Target, y = Previous.qualification..grade.))

lineind + 
  stat_summary(fun = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Student Outcomes", y = "Previous Qualification Grade") + 
  stat_summary(fun = mean, geom = "line", aes(group=1), colour = "Red", linetype = "dashed")


#----One-way ANOVA Assumptions----
#normality
tapply(mydata$Previous.qualification..grade., mydata$Target, shapiro.test) #violation for all groups

#HOV
library(car)
leveneTest(mydata$Previous.qualification..grade., mydata$Target) #not violated 

#----One-way ANOVA----
#analysis

gradeoutcome = aov(Previous.qualification..grade.~Target, data = mydata)
summary(gradeoutcome)


#effect sizes: Guidelines: .01 = small, .09 = medium, .25 = large effect size
library(effectsize)
eta_squared(gradeoutcome)##small effect
omega_squared(gradeoutcome)##small effect

#post hoc 

##Bonferroni (highly conservative)
pairwise.t.test(mydata$Previous.qualification..grade., mydata$Target, p.adjust.method = "bonferroni")

##Tukey (less conservative)
TukeyHSD(gradeoutcome)

describeBy(mydata$Previous.qualification..grade., group = mydata$Target)


#One way Anova for previous qualification grades among gender 


#c - One way Anova for previous qualification grades among different Marital Statuses

library(psych)
describeBy(mydata$Previous.qualification..grade., group = mydata$Marital.status)


mydata$Marital.status <- factor(mydata$Marital.status, 
                              levels = c(1, 2, 3, 4, 5, 6),
                              labels = c("Single", "Married", "Widowed", "Divorced", "Facto Union", "Legally Separated"))

library(ggplot2)
lineind <- ggplot(mydata, aes(x = Marital.status, y = Previous.qualification..grade.))

lineind + 
  stat_summary(fun = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Marital Statuses", y = "Previous Qualification Grade") + 
  stat_summary(fun = mean, geom = "line", aes(group=1), colour = "Red", linetype = "dashed")


#----One-way ANOVA Assumptions----
#normality
tapply(mydata$Previous.qualification..grade., mydata$Marital.status, shapiro.test) #error due to some groups being less than 3 

# Subseting the data for Single, Married, and Divorced
data_single = mydata[mydata$Marital.status == "Single", ]
data_married = mydata[mydata$Marital.status == "Married", ]
data_divorced = mydata[mydata$Marital.status == "Divorced", ]

# Apply Shapiro-Wilk normality test
normality_single = shapiro.test(data_single$Previous.qualification..grade.)
normality_married = shapiro.test(data_married$Previous.qualification..grade.)
normality_divorced = shapiro.test(data_divorced$Previous.qualification..grade.)

# the results
normality_single #violated
normality_married #violated
normality_divorced #violated

#HOV
library(car)
leveneTest(mydata$Previous.qualification..grade., mydata$Marital.status) #violated

#----One-way ANOVA----
#analysis

grademarriage = aov(Previous.qualification..grade.~Marital.status, data = mydata)
summary(grademarriage) #reain null







