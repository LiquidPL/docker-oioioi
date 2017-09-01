#!/bin/bash

mkdir storage

virtualenv venv
. venv/bin/activate

cd oioioi
pip install -r requirements.txt
