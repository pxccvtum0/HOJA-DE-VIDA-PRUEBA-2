#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate

# Crear/Asegurar superusuario
echo "Asegurando superusuario..."
echo "from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.filter(username='Zeta').exists() or \
User.objects.create_superuser('Zeta', 'Zeta@gmail.com', 'Zen1999')" \
| python manage.py shell