# Rapido Mini Practice

Overview
--------
This repository contains a small dataset and SQL practice file for the Rapido mini project. It includes ride and user data and a SQL script with example queries and exercises.

Files
-----
- [rapido_mini_practice.sql](rapido_mini_practice.sql) — SQL queries and exercises.
- [rides.csv](rides.csv) — Ride-level dataset (ride_id, user_id, distance_km, vehicle_type, etc.).
- [users.csv](users.csv) — User-level dataset (user_id, signup_date, origin_city, etc.).

Quick Start (DuckDB)
---------------------
1. Install DuckDB (CLI or Python): `pip install duckdb` or use system package.
2. Open a DuckDB shell and create tables from CSV:

```bash
duckdb rapido.db
.mode csv
SQL> CREATE TABLE rides AS SELECT * FROM read_csv_auto('rides.csv');
SQL> CREATE TABLE users AS SELECT * FROM read_csv_auto('users.csv');
SQL> .read rapido_mini_practice.sql
```

Python (quick run):

```python
import duckdb
con = duckdb.connect(':memory:')
con.execute("CREATE TABLE rides AS SELECT * FROM read_csv_auto('rides.csv')")
con.execute("CREATE TABLE users AS SELECT * FROM read_csv_auto('users.csv')")
sql = open('rapido_mini_practice.sql').read()
con.execute(sql)
```

Notes & Known Issues
--------------------
- The SQL script contains a few syntax issues (e.g., stray commas and simple typos) that will fail in strict SQL engines. See `rapido_mini_practice.sql` for lines to fix.
- `rides.csv` has some rows with empty `vehicle_type` values (rows with ride_id 101–104). Consider cleaning/normalizing these before analysis.
- Some `captain_rating` values are `0.0` — confirm whether `0.0` means missing or an actual rating.

Suggested Improvements
----------------------
- Data validation: add a small ETL step to validate types, fill or flag missing values, and enforce consistent date formats.
- Schema file: add a `schema.sql` or `schema.yml` documenting column types and constraints (PKs, FKs, not-null) for `users` and `rides`.
- Tests: include a couple of unit/integration queries as tests (e.g., row counts, no NULLs in primary keys).
- Documentation: add a short section describing each SQL exercise and expected outputs.
- Indexing / performance: if using a DBMS for larger data, add indexes on `user_id`, `ride_id`, and date fields.
- Versioning: add a simple `data/` folder and a `README-data.md` explaining data provenance and sample sizes.
- SQL style: normalize SQL formatting and use parameterized queries if embedding in apps.

Next Steps
----------
- I added this README to the repository. If you want, I can:
  - Fix the SQL syntax errors in `rapido_mini_practice.sql`.
  - Add a small data-cleaning script (Python) to pre-process the CSVs.
  - Create a `schema.sql` file and simple tests to validate imports.

Contact
-------
Open an issue or reply here with which next step you'd like me to do.
