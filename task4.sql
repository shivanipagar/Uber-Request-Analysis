--- 1. Total Number of Trips
SELECT COUNT(*) AS total_trips
FROM "Uberdata";

---2. Count of Trips by Status
SELECT "Status", COUNT(*) AS total
FROM "Uberdata"
GROUP BY "Status";

---3. Count of Trips by Pickup Point
SELECT "Pickup point", COUNT(*) AS trip_count
FROM "Uberdata"
GROUP BY "Pickup point";

--- 4. Trips per Day
SELECT DATE("Request timestamp") AS trip_date, COUNT(*) AS trips
FROM "Uberdata"
GROUP BY trip_date
ORDER BY trip_date;

--5. Average Trip Duration (Minutes)
SELECT 
    AVG(EXTRACT(EPOCH FROM ("Drop timestamp" - "Request timestamp")) / 60) AS avg_duration_minutes
FROM "Uberdata"
WHERE "Drop timestamp" IS NOT NULL;

--- 6. Longest Trip Details
SELECT *, 
  EXTRACT(EPOCH FROM ("Drop timestamp" - "Request timestamp")) / 60 AS trip_duration_minutes
FROM "Uberdata"
WHERE "Drop timestamp" IS NOT NULL
ORDER BY trip_duration_minutes DESC
LIMIT 1;

 --- 7. Busiest Day by Request Count
SELECT DATE("Request timestamp") AS trip_date, COUNT(*) AS total
FROM "Uberdata"
GROUP BY trip_date
ORDER BY total DESC
LIMIT 1;

--- 8. Trips per Driver
SELECT "Driver id", COUNT(*) AS total_trips
FROM "Uberdata"
GROUP BY "Driver id"
ORDER BY total_trips DESC;

---9. Airport Trips per Day
SELECT DATE("Request timestamp") AS trip_date, COUNT(*) AS airport_trips
FROM "Uberdata"
WHERE "Pickup point" = 'A'
GROUP BY trip_date
ORDER BY trip_date;

--- 10. Most Active Day (Duplicate of #8)
SELECT DATE("Request timestamp") AS trip_date, COUNT(*) AS total
FROM "Uberdata"
GROUP BY trip_date
ORDER BY total DESC
LIMIT 1;