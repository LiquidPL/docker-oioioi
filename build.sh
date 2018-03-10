#!/bin/bash

set -e

BUILD_PACKAGES="build-essential python2.7 python-dev virtualenv"

RUNTIME_PACKAGES="python2.7 libpython2.7 virtualenv wget texlive-latex-base texlive-lang-polish texlive-latex-extra texlive-fonts-recommended lighttpd libstdc++6:i386 zlib1g:i386"

sudo chown -R oioioi:oioioi /sio2

sudo dpkg --add-architecture i386

sudo apt-get update
sudo apt-get --no-install-recommends -y install $BUILD_PACKAGES

virtualenv -p python2 venv
. venv/bin/activate

cd oioioi
pip install -r requirements.txt
pip install psycopg2-binary uwsgi librabbitmq typing

# purge pip cache
rm -rf ~/.cache

cd ..

oioioi-create-config deployment
cd deployment

deactivate

sudo apt-get --purge -y remove $BUILD_PACKAGES
sudo apt-get --purge -y autoremove

sudo apt-get --no-install-recommends -y install $RUNTIME_PACKAGES

sudo rm -rf /var/lib/apt/lists/*

sudo rm /tmp/build.sh
