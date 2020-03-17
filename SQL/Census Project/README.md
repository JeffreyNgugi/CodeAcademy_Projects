
# Project: Analyzing Education & Census Data

## Data

I couldn't add the data csv file as GitHub limits the size of files allowed in repositories. However, be sure to find the data in the follwoing link: Census data:<https://docs.google.com/spreadsheets/d/1NAgjKKhdGrvwwlc0aoH4JvjrScsytst0g_cVCsdX0Jk/edit?usp=sharing> & Public data: <https://docs.google.com/spreadsheets/d/1EyKaewf2Oyhh_Qfmn_csZxxC1ypkb5oPsqMFfJTlndE/edit?usp=sharing>

## Objective:

```
Your advice is needed by a team of policymakers seeking to make more informed decisions on education. Help them investigate how external factors may influence performance in state assessment exams for public high school students.
```

The project is broken down into different part with Questions to help in analysis;

### Exploration: Familiarize yourself with the dataset.

        - How many public high schools are in each zip code? in each state?
                - The locale_code column in the high school data corresponds to various levels of urbanization as listed below. Use the CASE statement to display the corresponding locale_text and locale_size in your query result.

                Hint: Try taking a look at using the substr() function to help look at each part of the locale_code for determining locale_text and locale_size.

                locale_text |locale_code (locale_size)
                ------------|-----------------------------------------
                City	    | 11 (Large), 12 (Midsize), 13 (Small)
                Suburb	    |  21 (Large), 22 (Midsize), 23 (Small)
                Town	    | 31 (Fringe), 32 (Distant), 33 (Remote)
                Rural	    | 41 (Fringe), 42 (Distant), 43 (Remote)
        - What is the minimum, maximum, and average median_household_income of the nation? for each state?
        

### Analysis: Explore how home value differ by region as well as change over time.

        - Do characteristics of the zip-code area, such as median household income, influence    students’ performance in high school?
           Hint: One option would be to use the CASE statement to divide the median_household_income into income ranges (e.g., <$50k, $50k-$100k, $100k+) and find the average exam scores for each
        
## Additional Challenges
### Intermediate Challenge

        - On average, do students perform better on the math or reading exam? Find the number of states where students do better on the math exam, and vice versa.
            Hint: We can use the WITH clause to create a temporary table of average exam scores for each state, with an additional column for whether the average for math or reading is higher. (Note: Some states may not have standardized assessments, so be sure to also include an option for No Exam Data) Then, in your final SELECT statement, find the number of states fitting each condition.
### Advanced Challenge

        - What is the average proficiency on state assessment exams for each zip code, and how do they compare to other zip codes in the same state?
            Note: Exam standards may vary by state, so limit comparison within states. Some states may not have exams. We can use the WITH clause to create a temporary table of exam score statistic for each state (e.g., min/max/avg) - then join it to each zip-code level data to compare.

## Authors and acknowledgment

Great Appreciation and Acknowledgment to CodeAcademy.
Link to the Project: <https://discuss.codecademy.com/t/data-science-independent-project-3-education-census-data/419947>

