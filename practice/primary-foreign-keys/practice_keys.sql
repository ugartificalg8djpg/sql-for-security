-- Practice tables: primary key and foreign key
-- SQLite only: turn on foreign key checks first
PRAGMA foreign_keys = ON;

-- Parent table: each employee has a unique employee_id (PRIMARY KEY)
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    username    TEXT NOT NULL,
    department  TEXT,
    office      TEXT
);

-- Child table: each login attempt has a unique event_id (PRIMARY KEY)
-- employee_id here must match an employee_id in employees (FOREIGN KEY)
CREATE TABLE login_attempts (
    event_id    INTEGER PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    login_date  DATE,
    login_time  TIME,
    country     TEXT,
    success     INTEGER,   -- 1 = success, 0 = failed
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

INSERT INTO employees (employee_id, username, department, office) VALUES
(1001, 'asmith',  'Finance',          'East-120'),
(1002, 'bkhan',   'IT',               'West-210'),
(1003, 'cjones',  'Human Resources',  'North-105'),
(1004, 'dokafor', 'IT',               'West-215'),
(1005, 'ewilson', 'Sales',            'South-301'),
(1006, 'fpatel',  'Finance',          'East-122');

INSERT INTO login_attempts (event_id, employee_id, login_date, login_time, country, success) VALUES
(1,  1001, '2026-10-01', '08:55:12', 'UK',      1),
(2,  1002, '2026-10-01', '09:02:47', 'UK',      1),
(3,  1005, '2026-10-01', '23:41:05', 'Mexico',  0),
(4,  1005, '2026-10-01', '23:43:19', 'Mexico',  0),
(5,  1003, '2026-10-02', '08:30:00', 'UK',      1),
(6,  1004, '2026-10-02', '10:15:33', 'Canada',  1),
(7,  1001, '2026-10-02', '19:22:10', 'UK',      0),
(8,  1006, '2026-10-03', '07:58:44', 'UK',      1),
(9,  1002, '2026-10-03', '02:11:09', 'Germany', 0),
(10, 1005, '2026-10-03', '09:05:56', 'UK',      1),
(11, 1004, '2026-10-04', '12:40:21', 'Canada',  0),
(12, 1003, '2026-10-04', '08:47:38', 'UK',      1);
