FROM arm64v8/alpine:3.12.2
MAINTAINER fine <dlgmltjr0925@gmail.com>

#Install Java SDK
RUN apk update \
 && apk add openjdk11 bash

#Install Kafka
RUN wget https://apachemirror.sg.wuchna.com/kafka/2.6.0/kafka_2.12-2.6.0.tgz \
 && tar -xzf kafka_2.12-2.6.0.tgz \
 && rm kafka_2.12-2.6.0.tgz \
 && mv kafka_2.12-2.6.0 kafka

WORKDIR /kafka

EXPOSE 9092
ADD config/* /kafka/config/

CMD ["/bin/bash", "-c", "bin/kafka-server-start.sh config/server.properties"]

