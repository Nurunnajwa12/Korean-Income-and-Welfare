
# Korean Income and Welfare

![seoul-aesthetic-sky-oirqhpbhjvu3vvim](https://user-images.githubusercontent.com/89633522/188369511-1e6a10d4-299d-4e98-83c9-eca465fed21a.jpg)

This project are require to conduct an inference statistical analysis that cover the following analysis based on dataset https://www.kaggle.com/datasets/hongsean/korea-income-and-welfare.

## Data

Original data : https://www.kaggle.com/datasets/hongsean/korea-income-and-welfare.

Clean data : Download through repository file (Korea-Income-Clean.xlsx)

## Hypothesis Testing (Two Sample)

![gend](https://user-images.githubusercontent.com/89633522/189796933-4a48fe01-aef5-460c-881f-e46f2252b7f6.png)

Variables: Income and Gender.

We will test whether the mean of
income of male is different than the mean of income of female at 95% confidence level,
assuming unequal variances.

Analysis : Since t0= 0.347 is less than 1.96, we fail to reject the H0 at significant level, 0.05.
Conclusion : There is no sufficient evidence that mean income of male is different from mean income of female.

## Correlation Test

![baru](https://user-images.githubusercontent.com/89633522/189797531-f4a3a65b-df96-4c9e-a6ee-5df23868e47e.png)

Variables: Income and Family Members

We observe the strength of relationships between the two variables above by using Pearson product moment correlation.

Conclusion: r=0.267 ->relatively weak positive linear relationship between family members and income.

## Regression Test 

![incomey](https://user-images.githubusercontent.com/89633522/189796920-fb998e9c-c3cd-45e4-9d3a-63b9badaf8a3.png)

Independent value= Year born
Dependent value = income

We want to predict the value of income based on the year born.

Conclusion: 
- No year born has 0 year, b0 = -88674.14 is the portion of income not explained by year born.
-  b1 = 45.73 tell us that average income increases by 45.73 won, for each additional one year born.
- R squared = 0.078 (between 0 and 1)
- Therefore, weaker linear relationship between income and year born.
- Some but not all of the value of income explained by yea born.
- 7.8% of the variation in income explained by variation in year born.

## Chi Square Independent Test

![edumar](https://user-images.githubusercontent.com/89633522/189796995-439b784f-f974-4ecd-a026-364567572352.png)

Variables: Marriage and Educational Level

We want to test whether the educational level and marriage is independent or not.

Analysis: Since p-value <0.05, we reject H0 at significant level of 0.05.
Conclusion: There is sufficient evidence that educational level not independent to marriage

## Language

 R Programming

## Lessons Learned

For two-sample hypothesis tests, we fail to reject the null hypothesis. Thus, the mean of male income is equal to the standard of female income. Even though South Korea has faced gender inequality since a long time ago, the government is trying to close the gender gap, from government support for paternity leave to the role of the private sector in boosting women's careers. 

For correlation, the number of family members has a weaker positive relationship with income. In addition, we found that as each year is born, the income also increases by regression. This especially happens to people in their 30's to 50's. While, for the goodness of fit tests, we know that the proportion of doctoral degrees is the lowest. Besides, the Chi-Square Independent Test depicts that education and marriage are not independent.

The most exciting finding from our results is the result of two sample hypothesis testing indicate that 6 basic pillars of South Korea economy in term on gender equality where male and femake can hold same position without discrimination. In addition, income is not dependent on family members. Besides, the person that was born between 1960 until 1990 has made a strong base towards a well developed South Korea as they have become one of Four Asian Dragons with rapid industrialization and maintained exceptionally high growth rates.



## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## Feedback

If you have any feedback, please reach out to us at nurunnajwa21@gmail.com

