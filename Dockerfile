# Используем официальный образ Node.js Alpine как базовый образ
FROM node:14-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем Git
RUN apk add --no-cache git

# Копируем package.json и package-lock.json в рабочую директорию
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Клонируем репозиторий
ARG REPO_URL
RUN git clone $REPO_URL .

# Собираем приложение
RUN npm run build

# Устанавливаем сервер для обслуживания статических файлов
RUN npm install -g http-server

# Открываем порт 8080
EXPOSE 8080

# Запускаем http-server для обслуживания статических файлов
CMD ["http-server", "build"]
