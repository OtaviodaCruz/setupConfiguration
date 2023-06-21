#!/bin/bash

# Ubuntu 16.04
# ndn-cxx 0.6.1
# NFD 0.6.1

echo "Instalando git"

sudo apt update -y
sudo apt install -y git 

echo "--------------------------------------------------------------"
echo "Instalando pré requisitos ndn-cxx"

sudo apt-get install -y build-essential libsqlite3-dev libboost-all-dev libssl-dev 

echo "--------------------------------------------------------------"
echo "Baixando source ndn-cxx"

cd ~

git clone https://github.com/named-data/ndn-cxx --branch ndn-cxx-0.6.1 --single-branch

cd ndn-cxx

echo "--------------------------------------------------------------"
echo "Instalando ndn-cxx..."

./waf configure
./waf
sudo ./waf install

echo "--------------------------------------------------------------"
echo "Configurando ndn-cxx..."

sudo ldconfig

echo "--------------------------------------------------------------"
echo "ndn-cxx Instalado"

echo "--------------------------------------------------------------"
echo "Instalando pré requisitos NFD..."

sudo apt-get install -y build-essential pkg-config libboost-all-dev libsqlite3-dev libssl-dev libpcap-dev

echo "--------------------------------------------------------------"
echo "Baixando source NFD..."

cd ~

git clone https://github.com/named-data/NFD --branch NFD-0.6.1 --single-branch

cd NFD

git submodule init && git submodule update

echo "--------------------------------------------------------------"
echo "Instalando NFD..."

./waf configure
./waf
sudo ./waf install

echo "--------------------------------------------------------------"
echo "Configurando NFD..."

sudo cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf

echo "--------------------------------------------------------------"
echo "NFD Instalado..."


echo "--------------------------------------------------------------"
echo "Baixando ndnperf..."

cd ~

git clone https://github.com/Nayald/ndnperf --branch ndn-cxx-0.6.0 --single-branch

echo "--------------------------------------------------------------"
echo "Construindo ndnperf client..."

cd ndnperf/c++/client

cmake .
make

echo "--------------------------------------------------------------"
echo "Construindo ndnperf server..."

cd ndnperf/c++/server

cmake .
make
