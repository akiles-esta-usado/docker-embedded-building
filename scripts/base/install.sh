#!/bin/bash

set -ex

BUILD_DEPS=(
    binutils
	build-essential
	patch
	patchutils
	automake
	autoconf
	pkg-config
)

COMMON_DEPS=(
	locales
	libssl-dev
	libncurses5-dev
	bc
	m4
    time
	tzdata
)

SECURITY=(
    ca-certificates
	gnupg2
	gpg
	gperf
	openssl
	ssh-askpass
)

UTILITIES=(
	git
	python3-pip
	parallel
	sudo
	less
	make
	cmake
	wget
	curl
	gawk
    bzip2
	zip
	unzip
	tree
)

NERVES=(
	squashfs-tools
	libmnl-dev
)

apt -y update && apt install -y \
	"${BUILD_DEPS[@]}" \
	"${COMMON_DEPS[@]}" \
	"${SECURITY[@]}" \
	"${UTILITIES[@]}" \
	"${NERVES[@]}" \
	&& rm -rf /var/lib/apt/lists/*

update-alternatives --install /usr/bin/python python /usr/bin/python3 0
dpkg-reconfigure locales