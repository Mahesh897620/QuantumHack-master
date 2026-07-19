FROM php:8.1-cli

# Install mysqli extension for database connectivity
RUN docker-php-ext-install mysqli

# Copy all project files into /app
COPY . /app

# Set working directory
WORKDIR /app

# Expose default port (Railway overrides with $PORT)
EXPOSE 80

# Use PHP's built-in server — it automatically reads $PORT
CMD php -S 0.0.0.0:${PORT:-80} -t /app
