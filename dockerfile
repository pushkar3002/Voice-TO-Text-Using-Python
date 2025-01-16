# Use the official Python image as a base image
FROM python:3.9-slim

# Set environment variables to prevent Python from buffering stdout
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies for PyAudio and SpeechRecognition
RUN apt-get update && apt-get install -y \
    build-essential \
    portaudio19-dev \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir flask SpeechRecognition pyaudio

# Expose the port the app runs on
EXPOSE 5000

# Run the Python script directly
CMD ["python", "main.py"]
