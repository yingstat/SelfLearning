#!/bin/bash

number=1

set -x #turn tracing on
if [ $number = "1" ]; then
    echo "Number equals 1"
else
    echo "Number does not equal 1"
fi
set +x #turn tracing off
