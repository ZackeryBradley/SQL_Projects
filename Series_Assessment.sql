--Series_Assessment

-------------------Exercises to perform--------------
--1. get the name of the title, the rating provided, and who provided the rating
-----------------------------------------------------

SELECT title, rating, 
        CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviews
JOIN series 
ON
reviews.series_id = series.id 
JOIN reviewers 
ON reviews.reviewer_id = reviewers.id
ORDER BY title, rating DESC, reviewer