#!/bin/bash

. venv/bin/activate

cd deployment

python manage.py migrate
exec python manage.py supervisor
