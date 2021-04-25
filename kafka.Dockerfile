FROM arm64v8/alpine:3.12.2
MAINTAINER fine <dlgmltjr0925@gmail.com>

#Install Java SDK
RUN apk update \
 && apk add openjdk11 bash

#Install Kafka
RUN wget https://apachemirror.sg.wuchna.com/kafka/2.8.0/kafka_2.13-2.8.0.tgz \
 && tar -xzf kafka_2.13-2.8.0.tgz \
 && rm kafka_2.13-2.8.0.tgz \
 && mv kafka_2.13-2.8.0 kafka

WORKDIR /kafka

EXPOSE 9092
VOLUME ["/kafka/config"]

ENTRYPOINT ["/bin/sh", "-c", "entrypoint.sh"]

CMD ["/bin/bash", "-c", "bin/kafka-server-start.sh config/server.properties"]