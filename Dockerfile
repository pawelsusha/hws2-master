# Базовый образ
FROM node:23

# Установите рабочую директорию
WORKDIR /usr/src/app

# Копирование package.json и package-lock.json
COPY package*.json ./

# Установка зависимостей
RUN yarn install

# Копирование исходного кода приложения
COPY . .

# Указание порта
EXPOSE 3000

# Команда для запуска приложения
CMD ["yarn", "start"]
