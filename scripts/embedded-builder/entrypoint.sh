#!/bin/bash

set -e

usermod -u $USER_ID dev
usermod -g $USER_GROUP dev

if [ "$1" != "" ]; then
    /bin/bash -c $1
else
    /bin/bash
fi