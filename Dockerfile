FROM centos:latest
# CentOS requres to change baseurl for repo updates
WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# installing httpd and zip unzip
RUN yum install -y httpd
RUN yum install -y zip unzip
# adding some template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# changing workdir to html dir
WORKDIR /var/www/html/
# unzipping files
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rum -rf photogenic photogenic.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22