FROM ubuntu
MAINTAINER Yiling Jia <lynnjyl@gmail.com>
RUN apt-get update  &&  \
    apt-get install -y apache2  &&  \
    apt-get clean   &&  \
    rm -rf /var/lib/apt/list/*

EXPOSE 80
ADD run-apache.sh /run-apache.sh

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGOUND"]
