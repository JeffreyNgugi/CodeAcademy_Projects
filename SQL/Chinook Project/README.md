
# Project: Exploring a SQLite Sample Database

## Data

I couldn't add the data csv file as GitHub limits the size of files allowed in repositories. However, be sure to find the data in the follwoing link: <https://www.sqlitetutorial.net/sqlite-sample-database/>

## Objective:

```
You are the lead data analyst for a popular music store. Help them analyze their sales and service!
```

The project is broken down into different part with Questions to help in analysis;

### Exploration: Familiarize yourself with the dataset.

        - Which tracks appeared in the most playlists? how many playlist did they appear in?
        - Which track generated the most revenue? which album? which genre?
        - Which countries have the highest sales revenue? What percent of total revenue does each country make up?
        - How many customers did each employee support, what is the average revenue for each sale, and what is their total sale?
                
## Additional Challenges

### Intermediate Challenge

        - Do longer or shorter length albums tend to generate more revenue?
            Hint: We can use the WITH clause to create a temporary table that determines the number of tracks in each album, then group by the length of the album to compare the average revenue generated for each.
        - Is the number of times a track appear in any playlist a good indicator of sales?
            Hint: We can use the WITH clause to create a temporary table that determines the number of times each track appears in a playlist, then group by the number of times to compare the average revenue generated for each.
### Advanced Challenge

        - How much revenue is generated each year, and what is its percent change 18 from the previous year?
            Hint: The InvoiceDate field is formatted as ‘yyyy-mm-dd hh:mm:ss’. Try taking a look at using the strftime() function to help extract just the year. Then, we can use a subquery in the SELECT statement to query the total revenue from the previous year. Remember that strftime() returns the date as a string, so we would need to CAST it to an integer type for this part. Finally, since we cannot refer to a column alias in the SELECT statement, it may be useful to use the WITH clause to query the previous year total in a temporary table, and then calculate the percent change in the final SELECT statement.

## Authors and acknowledgment

Great Appreciation and Acknowledgment to CodeAcademy.
Link to the Project: <https://discuss.codecademy.com/t/data-science-independent-project-2-explore-a-sample-database/419945>

