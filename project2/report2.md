# Estimating the impact of negative Yelp reviews using business closures
Siddharth Garimella

I grew up in a neighborhood in which quite a few businesses came and went in the blink of an eye.
Either they resonated with nearby residents, joining a select few other local mainstays, or they would swiftly be forced to close.

With the advent of online rating platforms such as Yelp, however, I believe 
the margin of error for many small businesses has decreased even further. Yelp 
is becoming an increasingly popular platform for prospective consumers to choose
where to spend their money, and it is more and more important for many new businesses
on Yelp to maintain a good average rating.

But what happens when the ratings go bad? 
Do bad average ratings early on in a company's Yelp page deter customers enough 
to make a measurable financial impact on the business? To answer these questions, 
I run a Survival Analysis using the Yelp Academic dataset for different average ratings
on Yelp, and compare the output to find the difference in probabilities of closure 
at certain times in a business's "lifespan".


### About the Yelp Academic dataset

The Yelp Academic dataset is a subset of Yelp's businesses, reviews, and user data. It was originally put together for the Yelp Dataset Challenge on Kaggle, which was a chance for students to conduct research or analysis on Yelp's data and share their discoveries. The dataset contains information about 174,000 businesses across 11 metropolitan areas in four countries. For these businesses, 5.2 million reviews are provided, complete with the review text, date, and rating in stars.

Most of the businesses on Yelp are customer-facing (that's why they're there). More specifically, analysis of the tags used by each business reveals that there are more restaurants in the dataset than any other type of business. The data was collected between 2004 and 2017.

[Read more about the dataset here.](https://www.kaggle.com/yelp-dataset/yelp-dataset#yelp_academic_dataset_business.json)

### Guessing a business's lifespan

The dataset itself does not explicitly provide information about how long businesses last. Instead, all that is known for each business is whether the business is open or closed at the time of the dataset’s publication, and the dates of every review provided for that business on Yelp. 

One way we can “guess” how long a business on Yelp could have lasted is by finding the difference between the newest and oldest Yelp reviews for that business. This technique is used to analyze the potential impact of negative Yelp ratings later in the report, and it is important to note while reading that analysis that I’ve assumed this difference could provide a good estimate for actual closed businesses’ lifespans.

### Survival curves across Yelp rating tiers

There are nine unique ratings users can issue in a review on Yelp. They are 1 through 5 (inclusive), with intervals of half a star. An analysis of the distribution of ratings on Yelp shows that there are not all that many low star reviews on Yelp, with the most common rating being 4.

![alt text](figures/bcdf_ratings.jpg "CDF of ratings")

Removing duplicate businesses is important as it reduces the effect chain restaurants will have on the data. Such businesses are highly unlikely to close, and would have a disproportionate impact on the analysis due to the class size effect.

While it would normally first be best to understand how ratings are distributed in the dataset using a CDF, the data is right-censored, meaning we don't really know how long the lifespans of businesses that are currently still open will last. It is better to use survival curves to compare the data.

![alt text](figures/bsurv_ratings_tiered.jpg "Survival of rating tiers")

This results obtained here are quite strange, and suggest two things we wouldn't otherwise expect. First, the survival curves for the highest rated businesses and lowest rated businesses on Yelp are nearly identical, suggesting that there exists an equal likelihood of closure between the two groups. This makes no sense, as we would normally expect a business with very bad ratings to be at higher risk of closure than one with very good ratings. Second, it suggests average rated businesses are at higher risk of closure than either extreme. The survival curves for ratings between 2 and 3 seem close together, but show a greater probability of closure for earlier times than businesses with either very bad or very good reviews.

In investigating the results obtained above, the first step I took was to learn more about each tier. No tier had a surprisingly low number of associated businesses, which made low sample size not as much of a concern. On average, there were about 2000 businesses at each tier in the above analysis. 

The next step was to understand the highest and lowest rating survival curves independently. Of the nine discrete ratings users can provide on Yelp, the tier described by the highest tier on the plot from above captures the 4.5 and 5 star ratings. Could one of these ratings be throwing off the tier's survival curve?

![alt text](figures/bsurv_top_ratings.jpg "Survival of top rating tiers")

The survival curves above suggest there is quite a large stratification within the top tier itself, with the 5 star distribution consistently having a much lower probability of closure than the other ratings. Looking at the rating tier as a whole though, it appears highly unlikely business closures could actually behave this differently between a 4.5 and a 5.

Considering the differences within the top tier, it is also possible that the other tiers may have misrepresented certain ratings as well. 

![alt text](figures/bsurv_ratings_all.jpg "Survival at all rating tiers")

There are three groupings visible here, businesses rated between 3 and 4, businesses rated 2, 2.5, or 4.5, and businesses rated 5. Ultimately, the curves for mid-ratings (between 3 and 4) and for top-ratings of 5 make sense relative to each other, but it remains unclear why businesses rated so poorly in the 2, 2.5, 4.5 group do better than the mid-ratings group, as well as why businesses with ratings of 4.5 are grouped with 2 and 2.5 star businesses. 

[Read more](project2.ipynb)




