#!/bin/bash

# Command to download and run this script
# wget <PUT URL HERE> -O - | bash -
# curl -L <PUT URL HERE> | bash -

# Make list of already installed packages
pkg list-installed > starting-packages.txt
# TODO: Make this check if the file already exists

# Prepare package tool for use
pkg update -y
pkg upgrade -y
pkg install x11-repo -y

# Setup termux storage
termux-setup-storage
shopt -s extglob
sdcard=$(readlink -f ~/storage/external-1 | { read in; echo "${in%/Android+(/*)}"; })
ln -s $sdcard storage/sdcard

# Install Essentials
pkg install termux-api -y
pkg install man -y
pkg install proot -y
pkg install git -y

# Install Build tools
pkg install build-essential -y
pkg install cmake -y
pkg install binutils -y
# pkg install automake
# pkg install openssl-tool
# pkg install openssl-static


#### Essential Language Packages ####

# Install Rust
pkg install rust -y

# Install Python
pkg install python -y
pkg install python-pip -y
python -m ensurepip --upgrade
pip install wheel
# pkg install pypy3

# Install Python Poetry
pkg install python-cryptography -y
# export RUSTFLAGS=" -C lto=no"
curl -sSL https://install.python-poetry.org | python -

# Initialize Python Poetry
mkdir development/env/python

cd ~

# Install other Python deps
# pkg install python-numpy
# pkg install matplotlib
# 
# pkg install opencv-python
# pkg install asciinema

# Install Node.js
pkg install nodejs-lts


#### Extra Language Packages ####

# Install Java
pkg install openjdj-17

# Install Go
pkg install golang

# Install Perl
pkg install perl

# Install PHP
pkg install php


#### Additional Tools ####

# pkg install imagemagick
# pkg install inkscape
# pkg install android-tools
# pkg install argon2