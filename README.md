# Data-Analysis
UCI Machine Learning Repository Analysis Project
Irakli Matcharashvili
Data Analysis Project Sample
This data analysis project explores factors influencing student academic success and dropout rates using a dataset from the UCI Machine Learning Repository. The study focuses on variables such as Marital Status, Application Mode, Previous Qualification, Previous Qualification Grade, Daytime/Evening Attendance, Age at Enrollment, and Gender. The goal is to understand their impact on students' educational outcomes (Dropout, Enrolled, Graduate) through descriptive and inferential statistical analyses.

Descriptive Statistics
Variable Information
Marital Status: Integer (1 – single, 2 – married, 3 – widowed, 4 – divorced, 5 – facto union, 6 – legally separated)
Application Mode: Integer (Various codes representing different application modes)
Previous Qualification: Integer (Various codes representing different qualification levels)
Previous Qualification (Grade): Continuous (Grade of previous qualification, between 0 and 200)
Daytime/Evening Attendance: Integer (1 – daytime, 0 - evening)
Age at Enrollment: Integer (Age of student at enrollment)
Gender: Integer (1 – male, 0 – female)
Target: Categorical (Three levels: Dropout, Enrolled, Graduate)
Frequencies and Percentages
Marital Status:

Single: 892 (89.2%)
Married: 80 (8.0%)
Widowed: 3 (0.3%)
Divorced: 23 (2.3%)
Facto Union: 1 (0.1%)
Legally Separated: 1 (0.1%)
Application Mode:

1st phase - general contingent: 391 (39.1%)
...
Short cycle diploma holders: 7 (0.7%)
Previous Qualification:

Secondary education: 831 (83.1%)
...
Higher education - master (2nd cycle): 2 (0.2%)
Daytime/Evening Attendance:

Evening: 108 (10.8%)
Daytime: 892 (89.2%)
Gender:

Male: 255 (25.5%)
Female: 745 (74.5%)
Target:

Dropout: 292 (29.2%)
Enrolled: 175 (17.5%)
Graduate: 533 (53.3%)
Figure 1: Frequency Distribution of Student Outcomes

Means, Medians, and Standard Deviations
Previous Qualification Grade:

Mean: 132.4846
Standard Deviation: 13.07
Median: 133
Age at Enrollment:

Mean: 23.23
Standard Deviation: 7.76
Median: 20
APA Write-Up
The sample consists of 1000 students, predominantly single (892, 89.2%). Most students attend daytime classes (892, 89.2%), and the majority are female (745, 74.5%). The most common outcome is 'Graduate' (533, 53.3%). On average, students have a previous qualification grade of 132.48 (SD = 13.07), and they enroll at the age of 23.23 (SD = 7.76).

Inferential Statistics
Chi-Square Test of Independence
Hypotheses:

H0: Marital status and Academic Success are independent.
H1: Marital status and Academic Success are dependent.
Test Results:

Chi-Square Statistic: 17.216
Degrees of Freedom (df): 10
p-value: 0.07
Figure 2: Expected VS Observed Frequencies

Figure 3: Residuals

Decision:
Since p-value (0.07) > alpha (0.05), the null hypothesis is retained. There is no significant relationship between marital status and academic success in the sample.
One-Way ANOVA: Student Outcomes
Hypotheses:

H0: No differences in previous qualification grades among student outcomes.
H1: Significant differences in previous qualification grades among student outcomes.
Test Results:

F value: 3.932, p = 0.02
Post-hoc Tests:

Bonferroni test: Significant differences between Graduated and Dropout students (p = 0.027).
Tukey test: Graduates had significantly higher previous qualification grades compared to Dropouts.
Assumptions:

Violation of normality; caution in interpreting results.
One-Way ANOVA: Marital Status
Hypotheses:

H0: No difference in previous qualification grades among marital statuses.
H1: Difference in previous qualification grades among marital statuses.
Test Results:

F value: 0.605, p = 0.696
Decision:

Since p > 0.05, the null hypothesis is retained. No significant difference in previous qualification grades across marital statuses.
APA Write-Up
A comprehensive data analysis project exploring student academic success and dropout rates. Descriptive statistics provide an overview, while inferential statistics reveal relationships and differences. The findings contribute insights into the factors impacting students' educational trajectories. The project includes visualizations, hypothesis testing, and thorough interpretation of results. Caution is advised when assumptions are violated. The report ensures clarity for readers and encourages further exploration of the dataset.
