#!/bin/bash

# Install dependencies for building and testing Stratis on Debian.
# Packages are assumed to be for your native arcitecture.
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
	\
	asciidoc \
	clevis \
	clevis-luks \
	libcryptsetup-dev \
	libdbus-1-dev \
	?dbus-python-devel \
	?device-mapper-persistent-data \
	libssl-dev \
	python3-dbus \
	libsystemd-dev \
	xfsprogs \
	\
	python3-coverage \
	python3-dateutil \
	?python3-justbytes \
	python3-packaging \
	python3-psutil \
	python3-pyparsing \
	python3-pyudev \
	python3-semantic-version \
	python3-setuptools \
	python3-wcwidth