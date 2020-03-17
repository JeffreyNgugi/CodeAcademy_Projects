
# Project: Analyzing Airfare Data

## Data

I couldn't add the data csv file as GitHub limits the size of files allowed in repositories. However, be sure to find the data in the follwoing link: <https://docs.google.com/spreadsheets/d/1JOQ5bnInxX9Mpf_3xtsX38cw-G1uctiu5jTrjzkJoh0/edit#gid=809136041>

## Objective:

```
As the data analyst of a company, you are presented with the airfare data covering the top 1,000 contiguous state city-pair markets. Help them analyze this data and identify trends.
```

The project is broken down into different part with Questions to help in analysis;

### Exploration: Familiarize yourself with the dataset.

        -What range of years are represented in the data?
        -What are the shortest and longest-distanced flights, and between which 2 cities are they?
            Note: When we imported the data from a CSV file, all fields are treated as a string. Make sure to convert the value field into a numeric type if you will be ordering by that field. See here 49 for a hint.
        -How many distinct cities are represented in the data (regardless of whether it is the source or destination)?
            Hint: We can use UNION to help fetch data from both the city1 and city2 columns. Note the distinction between UNION and UNION ALL..
        

### Analysis: Explore how home value differ by region as well as change over time.

        -Which airline appear most frequently as the carrier with the lowest fare (ie. carrier_low)? -How about the airline with the largest market share (ie. carrier_lg)?
        -How many instances are there where the carrier with the largest market share is not the     carrier with the lowest fare? What is the average difference in fare?
        
## Additional Challenges
### Intermediate Challenge

        -What is the percent change 11 in average fare from 2007 to 2017 by flight? How about from 1997 to 2017?
            Hint: We can use the WITH clause to create temporary tables containing the airfares, then join them together to compare the change over time.
        -How would you describe the overall trend in airfares from 1997 to 2017, as compared 2007 to 2017?
### Advanced Challenge

        -What is the average fare for each quarter? Which quarter of the year has the highest overall average fare? lowest?
            Note: Not all flights (ie. each city-pair route) have data from all 4 quarters - which may skew the average. Let’s try considering only flights that have data available for all 4 quarters.
        -Considering only the flights that have data available on all 4 quarters of the year, which quarter has the highest overall average fare? lowest? Try breaking it down by year as well.
            Hint: To consider only flights that have data available for all 4 quarters, we could join the table with itself - each of those tables should be filtered to have data from one quarter.

## Authors and acknowledgment

Great Appreciation and Acknowledgment to CodeAcademy.
Link to the Project: <https://discuss.codecademy.com/t/data-science-independent-project-5-analyze-airfare-data/419949>

