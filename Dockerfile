# Этап 1: Сборка Java-приложения
FROM maven:3.8.4 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

# Этап 2: Построение образа с Jenkins и Java-приложением
FROM openjdk:8
EXPOSE 8080
# Копируем скомпилированное Java-приложение из предыдущего этапа
COPY --from=build /app/target/devops-integration.jar /devops-integration.jar

# Установка Docker в контейнере Jenkins
USER root
RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io
USER jenkins

# Добавляем Jenkins
# (Добавьте инструкции установки Jenkins, если они требуются)

# ENTRYPOINT для запуска Java-приложения
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
