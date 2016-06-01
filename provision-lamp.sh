#!/bin/bash
#This script is responsible for installing and configuring a specific application.

#Stop on errors
set -e

appName="LAMP"
appHomeDir=""
appUserName=""
appGroupName=""
appPassword=""
DBPASSWDR="password"

SERVERIP=`sh /shared/get-ip.sh`

echo "Beginning setup and configuration for $appName..."

echo "Installing system dependencies..."
#echo -e "\n--- Install MySQL specific packages and settings ---\n"
#echo "Installing mySQL Server..."
#echo "mysql-server mysql-server/root_password password $DBPASSWDR" | debconf-set-selections
#echo "mysql-server mysql-server/root_password_again password $DBPASSWDR" | debconf-set-selections
#apt-get install -y mysql-server

apt-get install -y apache2 libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt php-http-request2

echo "Updating Apache config to recognize index.php, index.phtml..."

cat > /etc/apache2/mods-enabled/dir.conf <<DELIM
<IfModule mod_dir.c>
	DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm index.php index.phtml
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
DELIM

#mkdir -p /shared/www
#sed -i 's/\/var\/www\/html/\/shared\/www/' /etc/apache2/sites-enabled/000-default.conf
#/var/www/html
cat > /etc/apache2/sites-enabled/000-default.conf <<DELIM
<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /shared/www
        <Directory /shared/www>
          Require all granted
        </Directory>

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
DELIM

#echo "Creating info.php"
#cat > /shared/www/info.php <<DELIM
#<?php
#phpinfo();
#?>
#DELIM

echo "Restarting Apache..."
service apache2 restart

echo "You may now connect to: http://$SERVERIP"
echo "THIS SERVER IS NOT SECURE!!! FOR LOCAL USE ONLY!!!"
