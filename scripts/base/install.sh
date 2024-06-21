#!/bin/bash

#set -ex

BUILD_DEPS=(
    binutils
	build-essential
	patch
	patchutils
)

TIMEZOME=(
    time
	tzdata
)

SECURITY=(
    ca-certificates
	gnupg2
	gpg
	gperf
	openssl
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
)

apt -y update && apt install -y \
	"${BUILD_DEPS[@]}" \
	&& rm -rf /var/lib/apt/lists/*