USE world;

# Question 1

SELECT
	COUNT(`Name`) AS "Number of US cities"
FROM
	`city`
WHERE
	`CountryCode` = "USA";

# Question 2

SELECT
	`Name` AS "Country with Highest Life Expectancy", `LifeExpectancy` AS "Life Expectancy"
FROM
	`country`
WHERE
	`LifeExpectancy` = (
    SELECT
		MAX(`LifeExpectancy`)
	FROM
		country
    )
;

# Question 3
    
SELECT
	`Name` AS "Cities with a name including 'New'"
FROM
	`city`
WHERE
	`Name` LIKE '%New%'
ORDER BY
	`Name`;

# Question 4

SELECT
	`Name` AS "First 10 Cities by Population", `Population`
FROM
	`city`
ORDER BY
	`Population` DESC
LIMIT 10;

# Question 5

SELECT
	`Name` AS "Cities with a population exceeding 2 million", `Population`
FROM
	`city`
WHERE
	`Population` > 2000000
ORDER BY
	`Population` DESC;

# Question 6
    
SELECT
	`Name` AS "Cities beginning with a 'Be' Prefix"
FROM
	`city`
WHERE
	`Name` LIKE 'Be%'
ORDER BY
	`Name` DESC;

# Question 7
    
SELECT
	`Name` AS "Cities with a population between 500,000 and 1,000,000", `Population`
FROM
	`city`
WHERE
	`Population` BETWEEN 500000 AND 1000000
ORDER BY
	`Population` DESC;
    
# Question 8

SELECT
	`Name` AS "Cities in ascending alphabetical order"
FROM
	`city`
ORDER BY
	`Name` ASC
LIMIT 10000;

# Question 9

SELECT
	`Name` AS "Most populated city", `Population`
FROM
	`city`
WHERE
	`Population` = (
    SELECT
		MAX(`Population`)
	FROM
		`city`
	)
;

# Question 10

SELECT
	DISTINCT(`Name`) AS "City name",
    COUNT(1) AS "Number of occurences around the world"
FROM
	`city`
GROUP BY
	`Name`
ORDER BY
	`Name` ASC
LIMIT 10000;

# Question 11

SELECT
	`Name` AS "City with the smallest population",
    `Population`
FROM
	`city`
WHERE
	`Population` = (
    SELECT
		MIN(`Population`)
	FROM
		`city`
	)
;

# Question 12

SELECT
	`Name` AS "Country with the largest population",
    `Population`
FROM
	`country`
WHERE
	`Population` = (
    SELECT
		MAX(`Population`)
	FROM
		`country`
	)
;

# Question 13

SELECT
	`Name` AS "Capital of Spain"
FROM
	`city`
WHERE
	`ID` = (
    SELECT
		`Capital`
	FROM
		`country`
	WHERE
		`Name` = 'Spain'
	)
;

# Question 14

SELECT
	`Name` AS "European Cities"
FROM
	`city`
WHERE
	`CountryCode` IN (
    SELECT
		`Code`
	FROM
		`country`
	WHERE
		`Continent` = 'Europe'
	)
ORDER BY
	`Name`;

# Question 15

SELECT
	`country`.`Name` AS Country,
    AVG(`city`.`Population`) AS "Average Population"
FROM
	`country`
JOIN
	`city` ON `country`.`Code` = `city`.`CountryCode`
GROUP BY
	`city`.`CountryCode`
ORDER BY
	AVG(`city`.`Population`) DESC;

# Question 16

SELECT
	`country`.`Name` AS Country, `city`.`Name` AS "Capital City",
    `city`.`Population` AS "Population Of Capital City"
FROM
	`country`
JOIN
	`city` ON `country`.`Code` = `city`.`CountryCode`
WHERE
	`ID` IN (
    SELECT
		`Capital`
	FROM
		`country`
	)
ORDER BY
	Country;

# Question 17

SELECT
	`Name` AS "Countries with low Population Density",
    `Population`/`SurfaceArea` AS "Population Density"
FROM
	`country`
ORDER BY
	`Population`/`SurfaceArea` ASC
LIMIT 50;

# Question 18

SELECT
    `city`.`Name` AS "Cities with high GDP per capita",
    `country`.`GNP`*(`city`.`Population`/`country`.`Population`) AS "GDP per capita"
FROM
	`city`
JOIN
	`country` ON `city`.`CountryCode` = `country`.`Code`
WHERE
	`country`.`GNP`*(`city`.`Population`/`country`.`Population`) > (
	SELECT
		AVG(GDP.GDP_Per_Capita)
	FROM
		(
        SELECT
			`country`.`GNP`*(`city`.`Population`/`country`.`Population`) AS GDP_Per_Capita
		FROM
			`city`
		JOIN
			`country` ON `city`.`CountryCode` = `country`.`Code`
        ) AS GDP
    )
ORDER BY
	`country`.`GNP`*(`city`.`Population`/`country`.`Population`) DESC
LIMIT 10000;

# Question 19

SELECT
	*
FROM
	(
    SELECT
		ROW_NUMBER() OVER(ORDER BY `Population` DESC) AS Rank_by_Population,
		`Name` AS City,
		`Population`
	FROM
		`city`
    ) AS Rank_Table
WHERE
	Rank_Table.Rank_By_Population BETWEEN 31 AND 40
ORDER BY
	`Population` DESC;
