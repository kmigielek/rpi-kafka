FROM arm64v8/ubuntu:20.04
MAINTAINER Fine <dlgmltjr0925@gmail.com>

#Install Java SDK
RUN apt-get update && \
    apt-get install -y default-jdk wget

#Install Kafka
RUN wget https://apachemirror.sg.wuchna.com/kafka/2.6.0/kafka_2.12-2.6.0.tgz && \
    tar -xzf kafka_2.12-2.6.0.tgz && \
    mv kafka_2.12-2.6.0 kafka

WORKDIR /kafka

EXPOSE 9092 2181
VOLUME ["/kafka/config"]

CMD ["/bin/bash", "-c", "bin/zookeeper-server-start.sh config/zookeeper.properties & bin/kafka-server-start.sh config/server.properties"]
