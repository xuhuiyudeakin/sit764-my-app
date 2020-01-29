#FROM node:alpine as builder
FROM ubuntu:18.04
MAINTAINER xuhuiyudeakin

RUN apt-get update && apt-get install npm -y 
RUN apt-get install nodejs
RUN apt-get update && apt-get install nginx -y

WORKDIR '/app'
COPY package.json .
COPY . . 

#RUN rm -rf node_modules
#RUN npm install -g react-scripts
RUN npm i

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