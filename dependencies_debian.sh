#!/bin/bash

# Install dependencies for building and testing Stratis on Debian.
# Packages are assumed to be for your native architecture.
# For clarity, packages are grouped into sections:
# - Base build tools (git, make)
# - Base toolchain (compilers and associated libraries)
# - Core library dependencies (D-Bus, device-mapper, systemd, etc.)
# - Python 3 dependences
apt -y install git \
	make \
	clang \
	gcc \
	libglib2.0-dev
	llvm-11 \
	llvm-11-dev \
	libudev-dev \
	\
	asciidoc \
	clevis \
	clevis-luks \
	libcryptsetup-dev \
	libdbus-1-dev \
	python3-dbus \
	libssl-dev \
	python3-dbus \
	libsystemd-dev \
	thin-provisioning-tools \
	xfsprogs \
	\
	python3-pip
	python3-venv
	python3-coverage \
	python3-dateutil \
	python3-packaging \
	python3-psutil \
	python3-pyparsing \
	python3-pyudev \
	python3-semantic-version \
	python3-setuptools \
	python3-wcwidth

# Needs logic control so this variable declaration isn't duplicated on successive runs
echo "export PATH=$HOME/.local/bin:$HOME/.cargo/bin" >> $HOME/.bashrc
source $HOME/.bashrc

# Official Rust install one-liner
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

python3 -m venv venv
. venv/bin/activate
python3 -m pip install justbytes
