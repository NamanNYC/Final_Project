# Final_Project


## Project Planning

### Data and ERD
Datasource: 
- https://wildfire.alberta.ca/resources/historical-data/historical-wildfire-database.aspx

ERD:
- ![](Images/ERD.png)

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

