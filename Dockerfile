FROM maven:3.6.1-jdk-7-alpine as build
WORKDIR /opt/demo
COPY . .
RUN mvn package -D skipTests

FROM tomcat as run
WORKDIR /usr/local/tomcat
COPY --from=build /opt/demo/target/sysfoo.war webapps/ROOT.war
CMD catalina.sh run


Facebooc

FROM ubuntu

WORKDIR /opt/facbooc

COPY  . .

RUN apt-get update && \
    apt-get install -yq build-essential make libsqlite3-dev sqlite3 && \
    make all

EXPOSE 16000

CMD bin/Facebook
