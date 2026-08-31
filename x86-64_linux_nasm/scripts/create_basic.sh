#!/bin/bash

echo -e "\e[0;34mCreating simple starting ARM program.\e[0m\n"
sleep 1
cp ../scripts/simple.asm ./
mv simple.asm $1
echo -e "\e[0;33mProgram contents loading:\e[0m\n"
sleep 1
cat $1
echo -e "\e[0;32mProgram created succesffully!\e[0m\n"

