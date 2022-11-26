FROM nginx:1.18

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y procps
RUN apt-get install -y net-tools
RUN apt-get install -y vim

ADD etc/nginx/fastcgi_params /etc/nginx/
ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/nginx/sites-enabled/www.codeigniter.co.conf /etc/nginx/sites-enabled/
ADD etc/nginx/sites-enabled/www.laravel.co.conf /etc/nginx/sites-enabled/

RUN rm -rf /etc/nginx/sites-enabled/default
