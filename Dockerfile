    # Utiliser une image de base Maven avec JDK 8
    FROM maven:3.8.5-openjdk-17 as build
    # Construire SatisWeb
    WORKDIR /selffocuslab
    COPY . /selffocuslab
    RUN mvn clean package

    # Créer l'image de production pour SatisWeb
    FROM openjdk:8-jre-slim
    COPY --from=build /selffocuslab/target/selfocuslabbackend-0.0.1-SNAPSHOT.jar /usr/local/lib/selfocuslabbackend.jar
    ENTRYPOINT ["java","-jar","/usr/local/lib/selfocuslabbackend.jar"]

