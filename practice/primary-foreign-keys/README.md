# Practice: Primary and foreign keys

Two linked tables, built in [`practice_keys.sql`](practice_keys.sql). Run it in any SQLite editor.

- `employees.employee_id` is the **primary key**: every employee has a unique ID.
- `login_attempts.employee_id` is a **foreign key**: every login must belong to a real employee.

## Sorting on more than one column

```sql
SELECT employee_id, username, department
FROM employees
ORDER BY department ASC, username DESC;
```

| employee_id | username | department |
|---|---|---|
| 1006 | fpatel | Finance |
| 1001 | asmith | Finance |
| 1003 | cjones | Human Resources |
| 1004 | dokafor | IT |
| 1002 | bkhan | IT |
| 1005 | ewilson | Sales |

## Testing the foreign key

```sql
UPDATE login_attempts
SET employee_id = 2000
WHERE event_id = 2;
```

Expected result: `FOREIGN KEY constraint failed`, because there is no employee 2000.

> **Why it matters:** the constraint stops logs from containing activity for users who don't exist.
