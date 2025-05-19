# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements.txt first to leverage layer caching
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app

# Expose the appropriate port (update to 5070 to match the docker run command)
EXPOSE 5070

# Define environment variable for the app
ENV PYTHONUNBUFFERED 1

# Use ENTRYPOINT to ensure that the application runs and allow CMD to specify arguments
ENTRYPOINT ["python", "product_list_app.py"]

# CMD can be left empty or specify additional parameters if needed
CMD []
