# Finding differences between Conservatives and Liberals

In a US Government class I took in high school, one of the first concepts my professor tried to teach the class was the inherent inaccuracy of the distinction between a "liberal" and a "conservative". The two terms are often used rather loosely, and tend to be associated with slightly different sets of values and ideals for different people. For the purposes of media, the two groups have been pit against each other as if the values and behaviors of each group are in complete opposition to each other, and it is likely this process has created broader misconceptions pertaining to each group.

I believe the only accurate understanding of how the two groups differ can be found in the data regarding their values, behaviors, and beliefs. Using the information gathered in the General Social Survey, I developed and executed a method of testing the effect sizes of various features across a section of the GSS dataset to identify the practices and issues around which identifying liberals and conservatives differ most. Here’s how I did it.

## About the General Social Survey

The General Social Survey (GSS) contains responses to a variety of demographic, behavioral, attitudinal, and special interest questions. The survey has been conducted for about 80 years, and is widely considered one of the best sources of sociological and attitudinal data covering the United States. For the purposes of this project, the GSS 'polviews' variable was used, and contains about 50,000 responses to a question regarding how conservative an individual believed they are.

## Trends

After going through the variables in GSS I had available to me, I chose a few variables I thought would greatly differ between liberals and conservatives, and analyzed each of the variables’ distributions, as well as their codewords. The variables I ended up choosing were all categorical in nature, and dealt with the respondents’ trust in others, belief in fairness, and personal happiness.

### Attendance at religious events

![](figures/attend.jpg)

### Opinions on same-sex relationships

![](figures/homosex.jpg)

### Age

![](figures/age.jpg)

## Conclusions

Although some of the trends explored here fit a lot of the generalizations we could’ve made already regarding what conservatives and liberals may hold different opinions on, exploring the data behind them exposes both trends that are not immediately obvious and some interesting nuances in the data itself. For one, I was unaware that there would any trend between attendance at religious events and conservativity, but data analysis here yields an effect size of 0.44 across frequency tiers ranging from 0 (for never having attended a religious event to 8 (for attending a religious event daily). After visualizing the trend, I could clearly observe the constant increase in frequency of attendance with increasing levels of conservativity. 
