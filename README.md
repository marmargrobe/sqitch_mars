Raw Data Table: Store raw Instagram data here (e.g., a table with columns like post_id, caption, location, etc.).

Categories Table: Store predefined categories in this table.

Master Table: This table will track the final categorization and other transformation results.

Use Amazon RDS for managed relational databases (like PostgreSQL or MySQL) or Amazon Aurora if you're looking for high scalability.


Set up venv
```
python3.12 -m venv .venv
```
Install dependencies
```
pip install -r requirements.txt
```
Export env var to shell
```
export $(cat .env | xargs)
```
