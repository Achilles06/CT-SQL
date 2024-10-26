create database FitnessCenterDB;
CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);
CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (id, name, age) VALUES (1, 'Jane Doe', 29);
INSERT INTO Members (id, name, age) VALUES (2, 'John Smith', 35);
INSERT INTO Members (id, name, age) VALUES (3, 'Alice Johnson', 27);
INSERT INTO Members (id, name, age) VALUES (4, 'Bob Martin', 45);
-- Insert data into WorkoutSessions table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (1, 1, '2024-10-01', '08:00 AM', 'Yoga');

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (2, 2, '2024-10-01', '09:00 AM', 'Cardio');

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (3, 3, '2024-10-02', '10:00 AM', 'Weight Lifting');

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (4, 4, '2024-10-02', '06:00 PM', 'Cycling');
-- Update Jane Doe's workout session time from '08:00 AM' to '06:00 PM'
UPDATE WorkoutSessions
SET session_time = '06:00 PM'
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe');
-- Delete workout sessions related to John Smith
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

-- Check the Members table
SELECT * FROM Members;
