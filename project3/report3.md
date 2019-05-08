# Data driven heart disease prediction
Siddharth Garimella

Heart disease is the leading cause of death for both men and women, and improvements in our ability to predict its presence early on could lead to better outcomes for many patients. Using the data from the Cleveland Heart Disease database, I aim to produce a model capable of estimating the probability a patient has heart disease given a limited set of biomedical information. 

## About the data
The dataset is available online on [Datadriven's website](), and has 14 features, with information ranging from patient identification to electrocardiographic data.  There are only 180 patients described in the training set, making the data quite small. The average age of patients described by the data is 55, and slightly over half are male. Predictions are desired for 90 patients for model evaluation, yielding a 0.66-0.33 train-test split. 

[](scatter.jpg)

Relationships between features in the data appear highly non-linear, and there are no clear correlations that can be made between any two variables in the data.

[](df.jpg)

Chest pain and whether or not the patient has had a “reversible defect” or “normal” thalium stress test result serve as the three most important predictors of heart disease in patients.

[Read more about the dataset]()

## Trying out models

I started by testing nine different approaches to modeling the data, and continued my analysis with only the highest scoring ones. Because the final submission to Drivendata is evaluated not by classification accuracy but by log-loss of probability scores, I made plots of the probability distributions for each model. I found that these distributions varied greatly, with some models producing higher confidence classifications on average than others. In this context, a “high confidence” prediction is defined as a prediction with a probability score close to zero or one. This suggests the model is near certain a classified patient either has or does not have heart disease.
The plots gave me some insight into how each model could end up scoring on the Drivendata challenge, but before my models could be evaluated, I needed to tune them.

## Tuning 

Hyperparameter tuning works differently for different models, but the simplest way to identify a set of good hyperparameters to use is simply just to try out various combinations of hyperparameters and evaluate their performances, choosing only the hyperparameter values that result in the best model scores.
For each model, I first conducted a random search across a large space of all potential hyperparameters. I then use the best scoring combination from this search as a guess for a grid search, and methodically evaluate every combination of neighboring values to find a hyperparameter set that works optimally. Most models tended to benefit from this process, but only marginally. 

## Feature interactions

To seek out more substantial improvements to the performance of my models, I revisited the data to identify if there were any features or feature combinations that I could synthesize myself. Using the same technique to evaluate feature importances I used while exploring the data, I multiplied every pair of columns in the dataset, took the top 3 most important features, and appended them to every patient in the training set. This method found some interesting potential new features, and contributed to minor increases in accuracy for some models. 

[](feats.jpg)

## Calibration

In the end, the Random Forest algorithm and Logistic Regression modeled the data best, scoring highest on Drivendata’s website. After my initial submission, though, I decided to revisit the probability score distributions for my models to make my models decide the probability of heart disease in patients more conservatively, so as to avoid the harsh penalty imposed on confident incorrect classifications the log-loss metric used by Drivendata evaluated models with. After applying a sigmoid calibration technique available in the `sklearn` library, models output probability scores that were less confident overall.

[](calibration.jpg)

Resubmission of the calibrated model output yielded unimpressive results. There are two reasons I believe this may be the case. First, it is possible the probability distribution expected by Drivendata has peaks near zero and one. In this case, mostly confident predictions are being expected, and the aggregate error of all the low confidence predictions is resulting in a lower score. Second, the calibration itself may be too harsh. In this case, less confidence is expected, but the probability scores were over adjusted.

[Read more](project3.ipynb)
