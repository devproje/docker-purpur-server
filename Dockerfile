FROM amazoncorretto:17-alpine-jdk

ARG VELOCITY_SECRET
ARG MINECRAFT_VERSION=1.19.3

ENV VELOCITY_SECRET=${VELOCITY_SECRET}

WORKDIR /opt/server

COPY ./data .

RUN wget https://api.purpurmc.org/v2/purpur/${MINECRAFT_VERSION}/latest/download -O purpur.jar
RUN chmod +x /opt/server/run.sh

ENTRYPOINT [ "/opt/server/run.sh" ]
