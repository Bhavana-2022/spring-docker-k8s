FROM amazoncorretto:17-alpine3.17
LABEL pro="bhavana"
RUN mkdir spc
WORKDIR /spc
COPY ./target/spring-petclinic-3.2.0-SNAPSHOT.jar /spc/spring-petclinic-3.2.0-SNAPSHOT.jar
ENTRYPOINT [ "java" ]
CMD [ "jar","spring-petclinic-3.2.0-SNAPSHOT.jar" ]
EXPOSE 8080