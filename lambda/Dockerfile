# Use an official Python image as the base image
FROM python:3.8

# Set the working directory inside the container
WORKDIR /app

# Install psycopg2 (PostgreSQL adapter) and any other dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt


# Copy the Lambda function code into the container
COPY index.py /app/

# Install any Python dependencies (if needed)
# RUN pip install some-package

# Set environment variables for PostgreSQL
ENV HOST_NAME = 'postgres'
ENV PORT = '5432'
ENV DB_NAME = 'd2d'
ENV USER_NAME = 'user_admin'
ENV PASSWORD = 'admin:abc'

# Define the Lambda function's entry point
CMD ["python", "index.py"]
