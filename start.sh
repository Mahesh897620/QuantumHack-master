#!/bin/bash
# Replace Apache's default port with Railway's dynamic $PORT
sed -i "s/Listen 80/Listen ${PORT:-80}/" /etc/apache2/ports.conf
sed -i "s/:80>/:${PORT:-80}>/" /etc/apache2/sites-enabled/000-default.conf

# Start Apache
apache2-foreground
