# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container


# WORKDIR /app

# Copy the current directory contents into the container at /
COPY . .


# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

ENV ENV=production
ENV CHAINLIT_AUTH_SECRET="vuXrLK%uSrvZ$?rC0FotE7rmzB*:lr6?hXdSL^-WQY_:SJ/lxY%4,f?T3d8pM=.4"

# Make port 80 available to the world outside this container
EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]