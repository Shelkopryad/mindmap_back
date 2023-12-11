# Используем официальный образ Ruby с версией, подходящей для вашего приложения
FROM ruby:2.7.4

# Установка зависимостей
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Устанавливаем Bundler
RUN gem install bundler

# Создаем и устанавливаем директорию для приложения
RUN mkdir /mindmap_back
WORKDIR /mindmap_back

# Копируем Gemfile и Gemfile.lock в директорию приложения
COPY Gemfile /mindmap_back/Gemfile
COPY Gemfile.lock /mindmap_back/Gemfile.lock

# Устанавливаем гемы
RUN bundle install

# Копируем код приложения в директорию приложения
COPY . /mindmap_back

# Указываем порт, который будет слушать контейнер
EXPOSE 3000

# Запускаем приложение при старте контейнера
CMD ["rails", "server", "-b", "0.0.0.0"]