#!/bin/bash

. venv/bin/activate

./wait-for-it.sh $DATABASE_HOST:$DATABASE_PORT

cd deployment

python manage.py migrate
python manage.py collectstatic --noinput
exec python manage.py supervisor
