#FROM node:alpine as builder
FROM ubuntu:18.04
MAINTAINER xuhuiyudeakin

#WORKDIR '/app'
#COPY package.json .
#COPY . . 
#���б�������
RUN sudo npm run build

#REPLACE CONF �滻�����ļ�
#ADD /nginx.conf /etc/nginx/nginx.conf

#ADD RESOUCES ��Ӿ�̬��Դ
#�Ƴ�nginxĬ�Ϸ���ҳ��
RUN sudo rm /var/www/html/index.html
RUN sudo mkdir -p /var/www/html/static
COPY build/ /var/www/html/static

#EXPOSE ӳ��˿�
EXPOSE 80

#CMD ������������
CMD ["nginx"]