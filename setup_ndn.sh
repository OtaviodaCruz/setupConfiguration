#!/bin/bash

# Ubuntu 16.04
# ndn-cxx 0.6.1
# NFD 0.6.1

echo "Instalando git"

sudo apt update -y
sudo apt install -y git 

echo "Instalando pré requisitos ndn-cxx"

sudo apt-get install -y build-essential libsqlite3-dev libboost-all-dev libssl-dev 

echo "Baixando source ndn-cxx"

git clone https://github.com/named-data/ndn-cxx --branch ndn-cxx-0.6.1 --single-branch

cd ndn-cxx

echo "Instalando ndn-cxx"

./waf configure
./waf
sudo ./waf install

echo "ndn-cxx Instalado"






#echo "Baixando source NFD"


#echo "Instalando pré requisitos NFD"


#echo "Instalando NFD"



#echo "NFD Instalado"
