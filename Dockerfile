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

# Copy and make startup script executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set working directory
WORKDIR /var/www/html

# Fix permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Railway sets $PORT dynamically — Apache will bind to it via start.sh
EXPOSE 80

CMD ["/start.sh"]
