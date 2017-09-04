#!/bin/bash

. venv/bin/activate

./wait-for-it.sh $DATABASE_HOST:$DATABASE_PORT

cd deployment

# prevent having any stale pidfiles in case of a dirty restart
rm pidfiles/*

python manage.py migrate
python manage.py collectstatic --noinput
exec python manage.py supervisor
