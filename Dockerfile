FROM maven:3.5-jdk-8 as BUILD
 
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package
COPY --from=BUILD /usr/src/app/target/authors.war /config/apps/

EXPOSE 3000