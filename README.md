# rpi-kafka docker

Kafka image available on Raspberry Pi with arm64v8 ubuntu installed.

## How to run

1. Setting the server and zookeeper property file.

- {project_root}/config/server.properties

```
...
advertised.listeners=PLAINTEXT://{your.host.name:9092} <-- replace your.host.name and service port
...
```

2. Running

```
$ docker run -d --name some-kafka-zookeeper -p 9092:9092 -v config:/kafka/config ${your_image_name}[:{version}]
```

## How to build

Run the command below from the root directory of project.

#### Kafka & Zookeeper

```
$ docker build . -t {your_image_name}[:{version}]
```

#### Kafka

```
$ docker build -f ./kafka/Dockerfile -t {your_image_name}[:{version}]
```

#### Zookeeper

```
$ docker build -f ./zookeeper/Dockerfile -t {your_image_name}[:{version}]
```
