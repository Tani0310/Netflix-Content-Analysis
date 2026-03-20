-- Create database
CREATE DATABASE IF NOT EXISTS netflix_analysis;

-- Use the database
USE netflix_analysis;

-- Drop table if exists
DROP TABLE IF EXISTS netflix_content;

-- Create table
CREATE TABLE netflix_content (
    show_id VARCHAR(20),
    type VARCHAR(50),
    title VARCHAR(500),
    director TEXT,
    cast_members TEXT,
    country VARCHAR(500),
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in VARCHAR(500),
    description TEXT,
    year_added INT,
    month_added VARCHAR(20)
);

-- Verify table was created
SHOW TABLES;

select * from netflix_content;

-- 1.  Total count
SELECT COUNT(*) FROM netflix_content;

-- 2. Top 10 Ratings
SELECT 
    rating,
    COUNT(*) as count
FROM netflix_content
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY count DESC
LIMIT 10;

-- 3. Content added by year
SELECT 
    year_added,
    COUNT(*) as count
FROM netflix_content
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added DESC;

-- 4. select title where country is india 
select title , country from netflix_content
where country = "india" ;

-- 5. select title where type is tv show
select title , type from netflix_content
where type = "TV show" ;

-- 6. Movies vs TV Shows Count
SELECT 
    type,
    COUNT(*) AS count
FROM netflix_content
GROUP BY type;

--  7: Find TV-MA (Adult) Content
SELECT 
    title,
    type,
    rating,
    release_year
FROM netflix_content
WHERE rating = 'TV-MA'
LIMIT 10;

-- 8: Recent Content (2020 and Later)
SELECT 
    title,
    type,
    year_added,
    rating
FROM netflix_content
WHERE year_added >= 2020
LIMIT 10;

-- 9: Newest Content (Most Recent)

SELECT 
    title,
    type,
    year_added,
    rating
FROM netflix_content
WHERE year_added IS NOT NULL
ORDER BY year_added DESC
LIMIT 10;

 