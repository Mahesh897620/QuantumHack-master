FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli sockets

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Ensure exactly one MPM is loaded (fixes "More than one MPM loaded").
# Remove any enabled MPM symlinks first, then enable exactly one.
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf \
    && a2enmod mpm_prefork \
    && apache2ctl -t

# Copy all project files
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Fix permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Use environment variables for DB connection (set in Railway dashboard)
# DB_HOST, DB_USER, DB_PASS, DB_NAME

EXPOSE 80
CMD ["apache2-foreground"]
