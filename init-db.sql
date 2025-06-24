-- Скрипт инициализации базы данных для PostgreSQL 15+
-- Автоматически выполняется при создании контейнера

-- Даем права пользователю django_user на схему public
GRANT ALL ON SCHEMA public TO django_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO django_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO django_user;

-- Устанавливаем права по умолчанию для будущих объектов
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO django_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO django_user;