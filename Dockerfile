FROM openjdk:15.0.1-slim-buster

RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean

RUN apt-get install -y unzip

RUN mkdir /app
ADD https://github.com/Wisser/Jailer/releases/download/v10.2.8/jailer_10.2.8.zip /tmp/temp.zip
RUN unzip /tmp/temp.zip -d /app
RUN rm /tmp/temp.zip

WORKDIR /app/jailer

CMD sh jailer.sh
