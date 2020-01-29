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

#运行编译命令
RUN npm run build

#REPLACE CONF 替换配置文件
#ADD /nginx.conf /etc/nginx/nginx.conf

#ADD RESOUCES 添加静态资源
#移除nginx默认访问页面
RUN rm /var/www/html/index.html
RUN mkdir -p /var/www/html/static
COPY build/ /var/www/html/static

#EXPOSE 映射端口
EXPOSE 80

#CMD 运行以下命令
CMD ["nginx"]