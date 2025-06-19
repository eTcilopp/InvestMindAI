FROM python:3.11-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Создание пользователя для безопасности
RUN useradd --create-home --shell /bin/bash app

# Установка рабочей директории
WORKDIR /app

# Копирование исходного кода (включая config/, manage.py и т.д.)
COPY . /app

# Копирование файлов зависимостей
COPY pyproject.toml poetry.lock* /app/

# Установка Poetry и зависимостей через uv
RUN uv pip install --system poetry
RUN poetry config virtualenvs.create false
RUN poetry install --only main --no-root

# Создание директорий для статических файлов и медиа
RUN mkdir -p staticfiles media

# Установка переменных окружения
ENV PYTHONPATH=/app/django-email-auth
ENV DJANGO_SETTINGS_MODULE=config.settings

# Установка прав доступа
RUN chown -R app:app /app
USER app

# Сбор статических файлов
RUN python manage.py collectstatic --noinput

# Открытие порта
EXPOSE 8000

# Команда запуска
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]