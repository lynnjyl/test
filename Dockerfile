FROM ubuntu

RUN     apt-get update  &&      \
        apt-get install -y apache2      &&      \
        apt-get clean   &&      \
        rm -rf /var/lib/apt/lists/*
ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN     mkdir -p /var/lock/apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/wwwi

EXPOSE 80
#ENTRYPOINT ["usr/sbin/httpd"]
CMD ["/run.sh"]
