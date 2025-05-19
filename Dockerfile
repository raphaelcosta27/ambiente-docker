FROM php:8.2-fpm

# Instala extensões do PHP e ferramentas básicas
RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instala o Node.js (para compilar o front-end com Vite, Tailwind, etc.)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir diretório de trabalho
WORKDIR /var/www/html

# Instalar as dependências do Node
RUN npm install -g npm

# Ajustar permissões para que o usuário tenha acesso à pasta
RUN sudo chown -R www-data /var/www/html \
    && chmod -R 775 /var/www/html

# Expor a porta 9000 para o PHP-FPM
EXPOSE 9000

# Definir o comando padrão
CMD ["php-fpm"]
