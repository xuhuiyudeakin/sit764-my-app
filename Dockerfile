#FROM node:alpine as builder
FROM ubuntu:18.04
MAINTAINER xuhuiyudeakin

WORKDIR '/app'
COPY package.json .
COPY . . 
RUN apt-get update && apt-get install npm -g -y npm@latest
RUN rm -rf node_modules
RUN apt-get install nodejs
#���б�������
RUN npm run build

#REPLACE CONF �滻�����ļ�
#ADD /nginx.conf /etc/nginx/nginx.conf

#ADD RESOUCES ��Ӿ�̬��Դ
#�Ƴ�nginxĬ�Ϸ���ҳ��
RUN rm /var/www/html/index.html
RUN mkdir -p /var/www/html/static
COPY build/ /var/www/html/static

#EXPOSE ӳ��˿�
EXPOSE 80

#CMD ������������
CMD ["nginx"]