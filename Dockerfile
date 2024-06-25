# Use the official Python image from Docker Hub
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app/backend

# Copy requirements.txt into the container at /app/backend
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Apply database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose port 8000 to the outside world
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
