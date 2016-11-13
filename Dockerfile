FROM ubuntu:14.04
RUN apt-get update && apt-get install -y apache2 \
	php5-mysql \
	wget \
	php5
RUN cd /var/www/html
RUN wget http://download.simplemachines.org/index.php/smf_2-1_beta2_install.tar.gz -P /var/www/html/
RUN tar xfvz /var/www/html/smf_2-1_beta2_install.tar.gz -C /var/www/html
RUN ls -l /var/www/html/
RUN chmod 777 /var/www/html/attachments/ \
	/var/www/html/avatars/ \
	/var/www/html/custom_avatar/ \
	/var/www/html/cache/ \
	/var/www/html/Packages/ \
	/var/www/html/Smileys/ \
	/var/www/html/Themes/ \
	/var/www/html/agreement.txt \
	/var/www/html/Settings.php \
	/var/www/html/Settings_bak.php
RUN rm /var/www/html/index.html
CMD /usr/sbin/apache2ctl -D FOREGROUND
EXPOSE 80
