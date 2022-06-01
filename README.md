[![Github Actions](https://img.shields.io/github/workflow/status/fogsy-io/dockerfiles/CI)](https://github.com/fogsy-io/dockerfiles/actions/)
## dockerfiles
This repository contains a collection of Dockerfiles for multi-arch builds. Some images such as **consul** and **influxdb** already provide multi-arch support such that we only edited the Docker image tags.

### Supported architectures
Currently, the resulting Docker images support the following CPU architectures:

* `amd64`
* `arm32v7`
* `arm64v8`

### Current versions

| Docker images  | version tags      |
|----------------|-------------------|
| ActiveMQ       | 5.16.5            |
| Consul         | 1.9.6             |
| CouchDB        | 2.3.1             |
| InfluxDB       | 2.2.0 | 1.8.10    |
| Kafka          | 2.2.0             |
| Zookeeper      | 3.4.13            |
| DNSmasq        | 1.0.7             |
| Flink          | 1.13.6-scala_2.11 |
| Openjdk-openj9 | stretch-slim      |

### Update base images/tags
You can find the used base images and tags within `docker-build.sh`.

**CI build**: update global bases images & tags in `docker-build.sh`. This will automatically overwrite the `ARG BASE_IMG=` argument inside each of the dedicated Dockerfiles.


### Credits
* Thanks to [wurstmeister](https://github.com/wurstmeister) for his great work on Kafka and Zookeeper Docker images
* Thanks to [consul](https://github.com/hashicorp/docker-consul) and [influxdb](https://github.com/influxdata/influxdata-docker) community for already providing multi-arch images.
