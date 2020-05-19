-- Group Project for TO640 @ UMich Ross

-- SQL Database: 2016Medicare Provider Utilization and Payment Data Public Use File. at https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Physician-and-Other-Supplier2016.html.

-- These providers are located at 1500 East Medical Center Drive (48109) and their typical training is medical school to obtain an M.D.
SELECT * FROM provider WHERE city = "ANN ARBOR" AND provider_type = "Sleep Medicine"


-- Total providers = 1,000,924; Total Individuals = 939,034; Total Organizations = 61,890
SELECT COUNT(*) FROM provider

SELECT entity_code, COUNT(*) FROM provider GROUP BY entity_code


-- About as expected given the relative population of MI to those states with more providers
SELECT state, COUNT(*) FROM provider GROUP BY state ORDER BY COUNT(*) DESC


-- Seattle, WA has most distinct providers with 82, but Detroit, city with the most distinct providers in MI, has 75. So Detroit has relatively almost the same amount of distinct providers, thus providing an almost equal spread of health services coverage, not taking into account population differences. 
SELECT state, city, COUNT(DISTINCT provider_type) FROM provider GROUP BY state, city ORDER BY COUNT(DISTINCT provider_type) DESC

SELECT state, city, COUNT(DISTINCT provider_type) FROM provider WHERE state = "MI" GROUP BY state, city ORDER BY COUNT(DISTINCT provider_type) DESC


-- PA has the largest, but MI is second largest 

SELECT state, COUNT(*) FROM provider WHERE gender = "F" AND provider_type = "Sleep Medicine" GROUP BY state ORDER BY COUNT(*) DESC



-- There are 15439  unique credentials
SELECT COUNT(DISTINCT credentials) FROM provider

“MD” is the most common and “M.D.” is the second most common.
SELECT credentials, COUNT(*) FROM provider GROUP By credentials ORDER BY COUNT(*) DESC
SELECT credentials, COUNT(*) FROM provider WHERE credentials LIKE "M.D%" OR credentials LIKE "MD_%" OR credentials LIKE "M%D%" GROUP By credentials ORDER BY COUNT(*) DESC


-- I identified almost 500k MDs. I choose the variations MD, M.D., and M.D because there was a steep drop off past the top three variations from 7a.
SELECT credentials, COUNT(*) FROM provider WHERE credentials IN ("MD", "M.D.", "M.D") GROUP By credentials ORDER BY COUNT(*) DESC


-- A majority of the zip codes in MI have a similar amount of providers, with a few of the big zip codes around Detroit, Ann Arbor, and Grand Rapids having almost double of more the amount of providers. Further, a zip code in Ann Arbor has the most providers, and this makes sense given the amount of students concentrated in the area.
SELECT state, zip, COUNT(*) FROM provider WHERE state = "MI" GROUP BY state, zip ORDER BY COUNT(*) DESC
