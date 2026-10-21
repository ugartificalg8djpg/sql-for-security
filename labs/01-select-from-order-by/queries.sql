-- Lab 1: Retrieve and sort data with SELECT, FROM and ORDER BY
-- Database: organization (MariaDB)

-- Task 1: Retrieve employee device data
SELECT *
FROM machines;

SELECT device_id, email_client
FROM machines;

-- Find devices with old patch dates (candidates for updating)
SELECT device_id, operating_system, OS_patch_date
FROM machines;

-- Task 2: Investigate login activity
-- Check login locations (expected: USA, Canada, Mexico)
SELECT event_id, country
FROM log_in_attempts;

-- Check login times for out-of-hours activity
SELECT username, login_date, login_time
FROM log_in_attempts;

SELECT *
FROM log_in_attempts;

-- Task 3: Order login attempts into a timeline
SELECT *
FROM log_in_attempts
ORDER BY login_date;

SELECT *
FROM log_in_attempts
ORDER BY login_date, login_time;

-- Extension: filter to one country
SELECT *
FROM log_in_attempts
WHERE country = 'USA';
