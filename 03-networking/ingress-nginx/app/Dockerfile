# Use the official image 
FROM python:3.7-slim

# Set the working directory in container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copyt the content of the local to the working directory
COPY . .

# Run app.py when the container launches
CMD ["python", "app.py"]