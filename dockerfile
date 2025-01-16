# Use an official base image (e.g., Python, Node.js, etc.)
FROM python:3.9-slim  # For a Python project (adjust as needed)

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary dependencies (for Python, using pip)
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app will run on
EXPOSE 5000  # Change to the port your application uses

# Define environment variables (optional)
ENV APP_ENV=production

# Command to run your application
CMD ["python", "app.py"]  # Change this to your main script or entry point
