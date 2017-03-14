wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenvwrapper
echo "VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source `which virtualenvwrapper.sh`" >> ~/.bashrc
mkdir ~/.virtualenvs
