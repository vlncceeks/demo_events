# Используем официальный Python образ в качестве базового
FROM python:3.9-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл зависимостей requirement.txt в контейнер
COPY requirement.txt /app/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirement.txt

# Копируем все остальные файлы проекта в контейнер
COPY . /app/

# Открываем порт, который будет использовать Django (по умолчанию это 8000)
EXPOSE 8000

# Команда для запуска приложения с gunicorn
CMD ["gunicorn", "events_project.wsgi:application", "--bind", "0.0.0.0:8000"]