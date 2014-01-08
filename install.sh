#!/usr/bin/env bash

echo "--- Good morning, master. Let's get to work. Installing now. ---"

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Set MySQL root password ---"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mattbanks14'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mattbanks14'

echo "--- Installing base packages ---"
sudo apt-get install -y vim curl python-software-properties

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Add PHP 5.4 repository ---"
sudo add-apt-repository -y ppa:ondrej/php5-oldstable

echo "--- Installing PHP-specific packages ---"
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core php-pear php5-dev make libpcre3-dev

echo "--- Installing APC ---"
sudo pecl install apc

cat << EOF | sudo tee -a /etc/php5/apache2/php.ini
extension = apc.so
EOF

echo "--- Enabling mod-rewrite ---"
sudo a2enmod rewrite

echo "--- What developer codes without errors turned on? Not you, master. ---"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

echo "--- Restarting Apache ---"
sudo service apache2 restart

echo "--- Composer is the future. But you knew that, did you master? Nice job. ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- All set to go! Would you like to play a game? ---"
