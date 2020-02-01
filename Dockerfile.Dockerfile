FROM ubuntu:18.04
MAINTAINER xuhuiyudeakin

#���ù���Ŀ¼
COPY . /app
WORKDIR /app

#��װ��������
RUN apt-get update && apt-get install npm -y 
RUN apt-get install nodejs
RUN apt-get update && apt-get install nginx -y

#�������
RUN npm i
RUN npm run build

#��Դ�ļ�����
RUN rm /usr/share/nginx/html/index.html
COPY /build /usr/share/nginx/html

EXPOSE 80

CMD nginx
