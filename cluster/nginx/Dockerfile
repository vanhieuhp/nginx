FROM nginx:perl
RUN apt update && apt install -y procps vim
RUN apt install --no-install-recommends apache2-utils -y
RUN mkdir -p /etc/pwd
RUN mkdir -p /home/django/staticfiles