FROM arm64v8/ubuntu:20.04
MAINTAINER Fine <dlgmltjr0925@gmail.com>

#Install Java SDK
RUN apt-get update
RUN apt-get install -y default-jdk 
RUN java --version

#Install Kafka
RUN apt-get install -y wget
RUN wget https://apachemirror.sg.wuchna.com/kafka/2.6.0/kafka_2.12-2.6.0.tgz
RUN tar -xzf kafka_2.12-2.6.0.tgz

WORKDIR /kafka_2.12-2.6.0
EXPOSE 9092

CMD ["/bin/bash", "-c", "bin/zookeeper-server-start.sh config/zookeeper.properties & && bin/kafka-server-start.sh config/server.properties"]
