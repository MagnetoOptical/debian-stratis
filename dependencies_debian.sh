#!/bin/bash

# Install dependencies for building and testing Stratis on Debian.
# Packages are assumed to be for your native architecture.
sudo apt -y install git make clang gcc libglib2.0-dev llvm-11 llvm-11-dev libudev-dev \
        curl asciidoc clevis clevis-luks libcryptsetup-dev libdbus-1-dev rustc cargo\
	python3-dbus libssl-dev python3-dbus libsystemd-dev \
	python3-jsonschema, python3-pydbus, python3-pycparser, python3-sysv_ipc, python3-setuptools
	thin-provisioning-tools xfsprogs python3-pip python3-venv python3-coverage \
	python3-dateutil python3-packaging python3-psutil python3-pyparsing \
	python3-pyudev 	python3-semantic-version python3-setuptools \
       	python3-wcwidth python3-dbus

# Needs logic control so this variable declaration isn't duplicated on successive runs
echo "export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" >> $HOME/.bashrc
source $HOME/.bashrc

# NOTE: It appears only rustc and cargo are needed; those can be installed via apt
# Derived from the official Rust install one-liner
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
#chmod +x rustup.sh
#./rustup.sh -q --profile default

python3 -m venv venv
source venv/bin/activate
python3 -m pip install justbytes

git clone https://github.com/stratis-storage/stratisd.git
cd stratisd
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$PATH
make build-all
sudo make install
cd ..
git clone https://github.com/stratis-storage/stratis-cli.git
cd stratis-cli
python3 setup.py install
