# Write your MySQL query statement below
SELECT 
    ROUND(
        COUNT(DISTINCT a1.player_id) / COUNT(DISTINCT a2.player_id),
        2
    ) AS fraction
FROM Activity a2
LEFT JOIN Activity a1
    ON a1.player_id = a2.player_id
    AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY)
WHERE a2.event_date = (
    SELECT MIN(event_date)
    FROM Activity a3
    WHERE a3.player_id = a2.player_id
);