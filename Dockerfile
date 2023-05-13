FROM centos:latest
RUN yum update httpd
RUN yum install httpd
RUN yum install zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/digimedia.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip digimedia.zip
RUN cp -rvf digimedia/* .
RUN rum -rf digimedia digimedia.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22