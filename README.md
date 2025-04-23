# cs421_Assignment
# Django API with PostgreSQL

## Overview
This project is a Django REST API with PostgreSQL  database. It includes two endpoints:
- **`/students`**: Returns a JSON response with a list of at least 10 students and their enrolled programs.
- **`/subjects`**: Returns a JSON response with subjects for the Software Engineering program, grouped by academic year (Years 1–4).

---

## Setup Guide

### 1. Create and Activate a Virtual Environment
```sh
python -m venv venv
# Activate the virtual environment
# I used Windows:
venv\Scripts\activate

```

### 2. Install Dependencies
```sh
pip install django djangorestframework psycopg2
```

### 3. Create Django Project and App
```sh
django-admin startproject students_api
cd students_api
python manage.py startapp api
```

### 4. Configure PostgreSQL Database
- Update `settings.py` with PostgreSQL connection details.
- In this project, the database was created using pgAdmin UI, right click on Databases and add database after the default database using your postgresql credeentials

### 5. Add Installed Apps in `settings.py`
- Include `rest_framework` and `api` in `INSTALLED_APPS`.

### 6. Run Migrations
```sh
python manage.py makemigrations
python manage.py migrate
```

### 7. Insert Data Using pgAdmin or SQL
- Use **pgAdmin UI** to insert data, or SQL queries according to your preference. I used pdAdmin, click on your database name>schemas>public>api_student, right click and choose view/edit data

### 8. Run the Server
```sh
python manage.py runserver
```

### 9. Test API Endpoints
####  **Students Endpoint**
- URL: `http://127.0.0.1:8000/api/students/`

####  **Subjects Endpoint**
- URL: `http://127.0.0.1:8000/api/subjects/`

---
# Backup Schemes
A backup scheme is a plan for creating, maintaining, and managing data backups, ensuring their availability for recovery.

## 1. Full Backup
How it's executed: Copies all data from the system all the time

### Advantages: 
1. Quick restore time
2. Easy storage management
3. Easy version control

### Disadvantages:
1. Demands the most storage space
2. Takes a long time to back up files depending on the size
3. Higher risk of data loss since all the data is stored in one place

## 2. Incremental Backup
How it's executed: Backs up data has changed since the last backup activity

### Advantages:
1. Efficient use of storage space

### Disadvantages:
1. Slower to restore since data must be pieced together from multiple backups

## 3. Differential Backup
How it's executed: backs up all changes made since the last full backup

### Advantages:
1. Faster to restore than incremental backup
2. Takes less space than full backup

### Disadvantages:
1. Potential for failed recovery if any of the backup sets are incomplete
2. Backup takes longer and requires more storage space than incremental backup
3. Slow and complex to restore compared to full backups
