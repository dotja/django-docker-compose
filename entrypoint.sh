#!/bin/sh

python manage.py migrate && python manage.py collectstatic &&

DJANGO_SUPERUSER_PASSWORD=$SUPER_USER_PASSWORD python manage.py createsuperuser --username $SUPER_USER_NAME --email $SUPER_USER_EMAIL --noinput

gunicorn django_project.wsgi:application --bind 0.0.0.0:8000

