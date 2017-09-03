#!/bin/bash

. venv/bin/activate

./wait-for-it.sh $DATABASE_HOST:$DATABASE_PORT

cd deployment

python manage.py migrate
exec python manage.py supervisor
