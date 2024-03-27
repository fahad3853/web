# Use Ubuntu as base image
FROM ubuntu:latest

# Install Apache and other required packages
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www/html

# Download and extract the website files
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip && \
    unzip oxer.zip && \
    rm -f oxer.zip

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apachectl", "-D", "FOREGROUND"]
