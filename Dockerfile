FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www


# 1. Copy composer files from the P2 folder
COPY P2/composer.json P2/composer.lock ./

# 2. Install dependencies (ADD --no-scripts HERE)
RUN composer install --no-interaction --prefer-dist --no-scripts

# 3. Copy the rest of the application FROM the P2 folder
COPY P2 .

# 4. Run the scripts now that the app files are present
RUN composer dump-autoload --optimize


# Create necessary directories
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache

# Set permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]