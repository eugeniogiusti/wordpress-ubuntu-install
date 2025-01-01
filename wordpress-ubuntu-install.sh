#!/bin/bash

# Update packages and install necessary dependencies
apt update
apt install -y apache2 php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip mysql-server php-mysql php-json php-imagick php-bcmath php libapache2-mod-php ghostscript

# Enable and restart services
systemctl enable --now apache2 mysql

# Securely configure MySQL
mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root';"
mysql_secure_installation <<EOF
n
y
N
y
y
EOF

# Create WordPress database and user
mysql -u root <<EOF
CREATE DATABASE wordpress_db DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'Password2025!';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
EOF

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress /var/www
chown -R www-data:www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress

# Configure Apache for WordPress
cat > /etc/apache2/sites-available/wordpress.conf <<EOF
<VirtualHost *:80>
   ServerName www.example.com
   ServerAlias example.com
   DocumentRoot /var/www/wordpress
   <Directory /var/www/wordpress>
       Options FollowSymLinks
       AllowOverride All
       DirectoryIndex index.php
       Require all granted
   </Directory>
   <Directory /var/www/wordpress/wp-content>
       Options FollowSymLinks
       Require all granted
       <FilesMatch "\.php$">
           Require all denied
       </FilesMatch>
   </Directory>
   ErrorLog ${APACHE_LOG_DIR}/wordpress-error.log
   CustomLog ${APACHE_LOG_DIR}/wordpress-access.log combined
</VirtualHost>
EOF

# Configure wp-config.php
cd /var/www/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress_db/g" wp-config.php
sed -i "s/username_here/wordpress_user/g" wp-config.php
sed -i "s/password_here/Password2025!/g" wp-config.php

# Activate WordPress site
a2dissite 000-default.conf
a2ensite wordpress.conf
a2enmod rewrite
systemctl reload apache2

echo "WordPress has been successfully installed. Visit http://your_local_ip to complete the setup."
