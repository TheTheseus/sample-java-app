FROM alpine/git
 
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package
COPY --from=BUILD /usr/src/app/target/sample-java-app-author.war /config/apps/

EXPOSE 3000