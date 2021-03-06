FROM ubuntu:14.04
# Устанавливаем зависимости
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q python-all python-pip
# Задаём текущую рабочую директорию
WORKDIR /tmp/test/
# Копируем код из локального контекста в рабочую директорию образа
COPY . .
# Установить зависимости из файла requirements.txt
RUN pip install -qr requirements.txt
# Настраиваем команду, которая должна быть запущена в контейнере во время его выполнения
ENTRYPOINT ["python", "./app.py"]
# Открываем порты
EXPOSE 5000
