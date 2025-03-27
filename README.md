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
#### 1️⃣ **Students Endpoint**
- URL: `http://127.0.0.1:8000/api/students/`

#### 2️⃣ **Subjects Endpoint**
- URL: `http://127.0.0.1:8000/api/subjects/`

---



