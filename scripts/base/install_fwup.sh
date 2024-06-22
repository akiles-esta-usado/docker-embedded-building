#!/bin/bash

set -ex

FWUP_URL=https://github.com/fwup-home/fwup/releases/download
FWUP_VERSION=1.10.2

wget -O fwup.deb "${FWUP_URL}/v${FWUP_VERSION}/fwup_${FWUP_VERSION}_amd64.deb"
dpkg -i fwup.deb
rm fwup.deb