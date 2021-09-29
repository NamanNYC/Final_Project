# Final_Project - Predicting Forest Fires
![Planning-for-wildfires-in-Alberta](https://user-images.githubusercontent.com/81877387/134839166-811be96c-c391-43e1-9e17-f7eeb712fa40.gif)

## Dashboard/Visualization:

![Dashboard 1](https://github.com/NamanNYC/Final_Project/blob/main/Images/data%20viz%201.PNG)
![Dashboard 2](https://github.com/NamanNYC/Final_Project/blob/main/Images/data%20viz%202.PNG)
![Web](![Dashboard 2](https://github.com/NamanNYC/Final_Project/blob/main/Images/data%20viz%202.PNG))

## Link to Dashboard: 
[Dashboard](https://us-east-1.quicksight.aws.amazon.com/sn/dashboards/a0399e3d-ce96-4d67-a611-0dd38ff32d83/views/0909b969-b1f9-4455-a463-17285afb95e1)

## Reason for our topic:
The reason for our choice of Predicting Forest Fires was due to many cases of forest fires occurring that show up in the news, specifically in the Alberta province. We came to an agreement on this topic by utilizing the online collabortive service called Miro to research different topics, what data is available for those topics and ultimately vote on a topic that we all mutually agreed to be the best topic to work with, which concluded in us choosing to predict forest fires in Alberta. 

## Description of source of data:
The data that we managed to research and ultimately decided to use is one from Wildfire Alberta. They have a total of 4 datasets on wildfires ranging all the way from 1961 to the latest file recorded in 2018. The file that we opted to use is from 2006 to 2018 with 19845 rows and 39 columns. The dataset includes crucial information such as fire size, the date it was detected, location of the fire, origin, as well as other information such as fire type, weather conditions over fire, fuel type, and more. 

## Questions to answer:
- can we predict the size of the next fire?
- to what level of accuracy can we predict the size of fire?

# Machine Learning Model

The machine learning model looked at predicting the growth of a wild fire. Wild fires have been increasingly devastating in many countries over the years. If we could build an accurate model, this may potentially provide a crucial time period of when a fire could be under control by being able to predict the growth of a wild fire. 

# Mock Machine Learning Model & Data Preprocessing
To build the final model, a mock model was built to test the data set prior to setting up the RDS. 4 data sets in csv files dating from 1983 to 2018 was available. Upon reviewing the data only data from 2006 - 2018 was used due to the different data frame information in prior files containing different information which was determined to be irrelevant for the model. 
Inspecting the data, we acknowledege the vast amount of rows and potential features that could be used, including a large amount of null value data and data which seemed to not be relevant based on using the data dictionary to help understand the data set. 
Deciding on the relevant features to use, we acknowledge the large amounts of continous and categorical data available. Due to a larger amount of feature enginneering needed for the final model, a few selected continous features were chosen to run the mock model. The dependent variable being the fire growth in size and the independent variables being the features chosen. For the mock model, the features used were the burning 'hours' (new column created by subtracting the fire start date & the discovered date); the size of the fire when the fire fighting began & the size of the hectares when the fire was under control. 

## Reason for Model Choice
Linear Regression was chosen for the mock & final model. Regression analysis was chosen as we are looking to find if there is a linear relationship between the chosen features and our dependent variable (fire growth). Regression analysis is also versatile and has a wide applicability, which will be required for the final model when added categorical features to model along with the continous features. Linear regression is also beneficial is it's simplicity and interpretability of the data. However we acknowledge that using this model, we can only consider linear relationships in our data set which in real world data, it is rarely linearly separable. Using this model, we also have to limit the number of dependent variables. 

## Feature Engineering & Feature Selection
The initial features engineering that was completed included:
* Removing numbers to identify ignition area (which was later decided to be dropped in the final dataframe)
* Creating the month of when the fire was discovered
* Converting strings to dates for start fire fighting date & fire held date (bh_fs_date)
* Calculating the number of days the fire was held before being under control
* Creating a fire growth size column
* Review and clean up categorical features in order to use classification machine models (encoded these features) 

Once feature engineering was completed, the team reviewed the features and decided on the final features that were deemed to be most important to be used for the model. As a team we also decided not to add too many features to the model incase the model was particularly sensitive. In the mock model, the accuracy results did not show an accurate model (less than 75% accuracy).

The features chosen were: 
* Calendar year
* Fire fighting start size
* Difference in hours (from start of fire fighting time to fire controlled time)
* Weather conditions over fire
* True Cause of fire 
* Fire Growth (y feature)

## Data split - Training & Testing Sets
In the final model, the data was split with a ratio of 75:25.

## Final Model Accuracy Score 
The accuracy score of the model was -6.23 was did not show a positive relationship between the independent variables to the dependent variables. Therefore, we conclude that our model was not successful in answering our question of being able to predict the growth of the next wildfire.


## Project Planning

### Data and ERD
Datasource: 
- https://wildfire.alberta.ca/resources/historical-data/historical-wildfire-database.aspx

ERD:
![](Images/ERD.png)

Description:
- The raw data contained a number of feature columns.
- In order to organize the data and help the data transformation process, columns were grouped by their features and split into the following seperate tables.
    - Detection: contains all data on how the fires were determined
    - Cause: contains most data on the cause of each fire
    - Loc: contains the location coordinates of each fire
    - Reponse: contains all data on the fire management response
    - Labels: contains categorical information of each fire
    - Extra: contains features that were deemed less useful for analytical purposes
    - Others: various dictionary tables were linked to elaborate on 3 letter-codes

## Communication Protocol
The way that our team has agreed to communicate is by utilizing Slack as the base of our communication (ex. need any immediate help, quick question, clarification on a topic, conduct a quick virtual call, etc.). We also agreed to conduct virtual meetings on designated days and times in order to ensure everyone is on the same page, and everyone remains on the same page. 

## Google Slides Presentation Link
[Google Slides](https://docs.google.com/presentation/d/117F7IS3yFacNfmIY9zos-4fqOf8Ne2q4_9VZze44nqo/view#slide=id.g1f87997393_0_782)
