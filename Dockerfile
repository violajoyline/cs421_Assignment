# Use the official Python image as base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    libpq-dev \
    netcat-openbsd \
    && apt-get clean

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/



# Expose port (Django runs on 8000)
EXPOSE 8000

# Start server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
