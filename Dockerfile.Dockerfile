FROM ubuntu:18.04
MAINTAINER xuhuiyudeakin

#设置工作目录
COPY . /app
WORKDIR /app

#安装依赖环境
RUN apt-get update && apt-get install npm -y 
RUN apt-get install nodejs
RUN apt-get update && apt-get install nginx -y

#打包编译
RUN npm i
RUN npm run build

#资源文件配置
RUN rm /usr/share/nginx/html/index.html
COPY /build /usr/share/nginx/html

EXPOSE 80

CMD nginx
