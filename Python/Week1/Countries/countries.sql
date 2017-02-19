# NUMBER 1
SELECT countries.name, languages.language, languages.percentage FROM countries
LEFT JOIN languages ON languages.country_id = countries.id
WHERE languages.language LIKE "Slovene" ORDER BY percentage DESC;

# NUMBER 2
SELECT countries.name, COUNT(*) as cities FROM countries
JOIN cities ON cities.country_id = countries.id
GROUP BY countries.name
ORDER BY COUNT(*) DESC;

# NUMBER 3
SELECT cities.name, cities.population FROM cities
LEFT JOIN countries ON cities.country_id = countries.id
WHERE countries.name LIKE "Mexico"
AND cities.population > 500000;

# NUMBER 4
SELECT countries.name, languages.language, languages.percentage FROM languages
LEFT JOIN countries ON languages.country_id = countries.id
WHERE languages.percentage > 89.0
ORDER BY languages.percentage DESC;

# NUMBER 5
SELECT name, surface_area, population FROM countries
WHERE surface_area < 501
AND population > 100000;

# NUMBER 6
SELECT name, government_form, capital, life_expectancy FROM countries
WHERE government_form LIKE "Constitutional Monarchy"
AND capital > 200
AND life_expectancy > 75;

# NUMBER 7
SELECT countries.name, cities.name, cities.district, cities.population FROM cities
LEFT JOIN countries ON cities.country_id = countries.id
WHERE cities.district LIKE "Buenos Aires"
AND cities.population > 500000
ORDER BY cities.population DESC;

# NUMBER 8
SELECT region, COUNT(*) as countries FROM countries 
GROUP by region
ORDER BY countries DESC;