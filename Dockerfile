# Используем официальный образ Node.js Alpine как базовый образ
FROM node:14-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем Git
RUN apk add --no-cache git

# Копируем package.json и yarn.lock в рабочую директорию
COPY package.json yarn.lock ./

# Устанавливаем зависимости
RUN yarn install

# Клонируем репозиторий
ARG REPO_URL
RUN git clone $REPO_URL .

# Собираем приложение
RUN yarn build

# Устанавливаем serve для обслуживания статических файлов
RUN yarn global add serve

# Открываем порт 5000
EXPOSE 5000

# Запускаем serve для обслуживания статических файлов
CMD ["serve", "-s", "build"]
