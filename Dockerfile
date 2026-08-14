FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/my-first-cicd-project-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD wget -q -O - http://localhost:8080/ || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
