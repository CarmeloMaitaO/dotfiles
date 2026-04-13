# SQL (SQLite) Best Practices

## Usage Constraint
- All SQL code MUST be written in dedicated `.sql` files.
- SQL queries MUST be implemented as prepared statements within the application code, never executed directly.

## Nim Interop
- Use Nim's `db_sqlite` or similar modules to load and bind variables to prepared statements from the SQL files.
