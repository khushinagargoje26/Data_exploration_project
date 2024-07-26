#Calculate summary statistics (mean, median, mode, standard deviation) 
1.For calculating mean
SELECT 
    AVG(Age) AS mean_age,
    AVG(SibSp) AS mean_sibsp,
    AVG(Parch) AS mean_parch,
    AVG(Fare) AS mean_fare
FROM test;
2.For calculating mediun 
SELECT 
    AVG(subq.Age) AS median_age
FROM (
    SELECT 
        Age
    FROM 
        test
    WHERE 
        Age IS NOT NULL
    ORDER BY 
        Age
    LIMIT 1 OFFSET (SELECT FLOOR(COUNT(*) / 2) FROM test WHERE Age IS NOT NULL)
) AS subq;
3.For calculating mode 
SELECT 
    Age AS mode_age
FROM 
    test
GROUP BY 
    Age
ORDER BY 
    COUNT(Age) DESC
LIMIT 1;
4.STANDARD DIVISION
SELECT 
    STDDEV(Age) AS stddev_age,
    STDDEV(SibSp) AS stddev_sibsp,
    STDDEV(Parch) AS stddev_parch,
    STDDEV(Fare) AS stddev_fare
FROM test;

