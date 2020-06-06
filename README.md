# IntellijIDEA

```sh
$ docker build --no-cache --build-arg MAVEN_VERSION=3.6.3-openjdk-11-slim --build-arg INTELLIJIDEA_VERSION=2020.1 --file Dockerfile . --tag intellijidea-2020.1:maven-3.6.3-openjdk-11
```
```sh
$ xhost +local:docker
```
```sh
$ docker run -it --volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY=unix$DISPLAY --name intellijidea-2020.1 86eb7272b384
```
