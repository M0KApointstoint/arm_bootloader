#!/bin/bash

arm-linux-gnueabihf-as $1 -o temp.o
arm-linux-gnueabihf-ld temp.o
./a.out
rm temp.o
echo "assembled, linked, ran"

