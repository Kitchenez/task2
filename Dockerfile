# Указываем базовый образ, содержащий JDK
FROM openjdk:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта в образ
COPY . /app

# Собираем проект
RUN javac -cp junit.jar:. *.java

# Указываем команду по умолчанию для запуска (если нужно)
# CMD ["java", "MainClass"]
