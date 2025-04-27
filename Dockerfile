# Use official PHP 8.3 FPM image
FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    libcurl4-openssl-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install \
    curl \
    gd \
    mbstring \
    mysqli \
    pdo \
    pdo_mysql \
    zip

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY . .

# Set proper permissions (important for CodeIgniter)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port (optional, App Platform manages ports itself)
EXPOSE 8080

# Start PHP-FPM
CMD ["php-fpm"]
