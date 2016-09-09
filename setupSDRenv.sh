#!/bin/bash
#This script is aimed to help people setting up their Linux environment to work with SDR.
#The script installs the following tools:
# Gnuradio
# Inspectrum
# QspectrumAnalyzer
# Bpython
# Audacity

# Git engine, in case it is not installed. mandatory for compiling code from Github
sudo apt-get install git

#Gnuradio:
sudo apt-get install gnuradio

# RTL-SDR libraries
cd ~
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

#Gqrx
sudo apt-get purge --auto-remove gqrx
sudo apt-get purge --auto-remove gqrx-sdr
sudo add-apt-repository -y ppa:ettusresearch/uhd
sudo add-apt-repository -y ppa:myriadrf/drivers
sudo add-apt-repository -y ppa:myriadrf/gnuradio
sudo add-apt-repository -y ppa:gqrx/gqrx-sdr
sudo apt-get update
sudo apt-get install gqrx-sdr

# Inspectrum
sudo apt-get install autoconf
sudo apt-get install qt5-default libfftw3-dev cmake pkg-config

cd ~
git clone git://github.com/jgaeddert/liquid-dsp.git
cd liquid-dsp
./bootstrap.sh
./configure
make
sudo make install

cd ~
git clone https://github.com/miek/inspectrum
cd inspectrum
mkdir build
cd build
cmake ..
make
sudo make install

#QspectrumAnalyzer (along with dependencies: tclap, rtl-pwer-fftw and python packages)
sudo apt-get install libfftw3-dev libtclap-dev
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install python3-pip python3-pyqt4 python3-numpy
sudo pip3 install qspectrumanalyzer

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

#Bpython
sudo apt-get install bpython

# Audacity
sudo apt-get install audacity

#Octave:
sudo apt-get install liboctave-dev
#in octave:
#>> pkg install control -forge
#>> pkg install signal -forge
#>> pkg install communications -forge


#libvolk1-bin to optimize GNU Radio performance  (take's time):
sudo apt-get install libvolk1-bin
volk_profile


git clone https://github.com/raziele/MyGateOpener
