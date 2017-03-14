#!/bin/bash
# Autor: Victor Hugo Arnaud Deon
# Script: ./python3.6.sh
# ----------------------------------- #
# Esse programa irá instalar o python3.6
# Entrada: N/A
# Saida: python3.6
# ----------------------------------- #

sudo apt-get install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

echo "Indo para /usr/src"
cd /usr/src
pwd
sudo wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz
sudo tar xzf Python-3.6.0.tgz
cd Python-3.6.0
pwd
sudo ./configure
sudo make altinstall
sudo python3.6 -V
