-- Подключитесь к PostgreSQL как суперпользователь (postgres) и выполните:

-- Вариант 1: Дать права на схему public для конкретного пользователя
GRANT ALL ON SCHEMA public TO django_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO django_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO django_user;

-- Вариант 2: Восстановить права по умолчанию для всех пользователей (как в старых версиях)
GRANT USAGE, CREATE ON SCHEMA public TO PUBLIC;