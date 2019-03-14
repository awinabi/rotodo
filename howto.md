
## Create Postgres DB with User


```sql
create database rotodo;
create user ruser with encrypted password 'password';
grant all privileges on database rotodo to ruser;
```
