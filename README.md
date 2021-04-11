# rpi-kafka docker

Kafka image available on Raspberry Pi with arm64v8 alpine installed.

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

#### Kafka & Zookeeper

Run the command below from the root directory of project.

```
$ docker build -t {your_image_name}[:{version}] .
```

#### Kafka

Run the command below from {project_root}/kafka

```
$ docker build -t {your_image_name}[:{version}] -f kafka.Dockerfile .
```

#### Zookeeper

Run the command below from {project_root}/kafka

```
$ docker build -t {your_image_name}[:{version}] -f zookeeper.Dockerfile .
```
