# Используем JDK как базовый образ
FROM openjdk:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код и файлы JUnit в контейнер
COPY . /app
COPY junit.jar /app

# Компилируем исходный код Java с использованием JUnit
RUN javac -cp junit.jar:. *.java

# Команда для запуска приложения (если нужно)
# CMD ["java", "MainClass"]
