#!/bin/bash

cd ~
git clone https://github.com/miek/inspectrum
cd inspectrum
mkdir build
cd build
cmake ..
make
sudo make install

cd ~
wget https://launchpad.net/ubuntu/+archive/primary/+files/tclap_1.2.1.orig.tar.gz
tar -xf tclap_1.2.1.orig.tar.gz
cd tclap-1.2.1
./configure
make
sudo make install

cd ~
git clone https://github.com/AD-Vega/rtl-power-fftw

cd rtl-power-fftw
mkdir build
cd build
cmake ..
make
sudo make install

sudo apt-get install python3-pip python3-pyqt4 python3-numpy
sudo pip3 install qspectrumanalyzer

sudo apt-get install bpython

git clone https://github.com/raziele/MyGateOpener

sudo apt-get install audacity
