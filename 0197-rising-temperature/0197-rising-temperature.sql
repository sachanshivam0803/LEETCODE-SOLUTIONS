# Write your MySQL query statement below
SELECT Weather.id
FROM Weather
JOIN Weather W
ON DATEDIFF(Weather.recordDate, W.recordDate) = 1
WHERE Weather.temperature > W.temperature;