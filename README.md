# Netflix Movies and TV Shows Data Analysis using SQL

![Netflix Logo](https://github.com/sharathjain01/NETFLIX_SQL_PROJECT/blob/main/logo.png)

Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems,findings, and conclusions.

Objectives
Analyze the distribution of content types (movies vs TV shows).
Identify the most common ratings for movies and TV shows.
List and analyze content based on release years, countries, and durations.
Explore and categorize content based on specific criteria and keywords.
Dataset
The data for this project is sourced from the Kaggle dataset:

```
Schema
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
Business Problems 
1. Count the Number of Movies vs TV Shows
2. List All Movies Released in a Specific Year (e.g., 2020)
3. Find the Top 5 Countries with the Most Content on Netflix
4. Identify the Longest Movie
5. Find Content Added in the Last 5 Years
6. Find All Movies/TV Shows by Director 'Rajiv Chilaka'
7. List All TV Shows with More Than 5 Seasons
8. Count the Number of Content Items in Each Genre
9. List All Movies that are Documentaries
10. Find All Content Without a Director
11. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
12. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
13. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
14. find the films which was released in 2020

Findings and Conclusion
Content Distribution: The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
Common Ratings: Insights into the most common ratings provide an understanding of the content's target audience.
Geographical Insights: The top countries and the average content releases by India highlight regional content distribution.
Content Categorization: Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.
This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.

