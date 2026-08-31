#!/bin/bash

echo -e "\e[0;34mStarting script.\e[0m\n"
sleep 0.5
echo -e "\e[0;33mAssembling:\e[0m\n"
sleep 0.5
arm-linux-gnueabihf-as $1 -o temp.o
sleep 0.5
echo -e "\e[0;32mAssemble complete.\e[0m\n"
sleep 0.5
echo -e "\e[0;33mLinking:\e[0m\n"
sleep 0.5
arm-linux-gnueabihf-ld temp.o
echo -e "\e[0;32mLink complete.\e[0m\n"
sleep 0.5
echo -e "\e[0;33mRunning:\e[0m\n"
sleep 0.5
./a.out
sleep 0.5
echo -e "\e[0;32mRun complete.\e[0m\n"
sleep 0.5
echo -e "\e[0;31mRemoving temporary object file.\e[0m\n"
sleep 0.5
rm temp.o
echo -e "\e[0;34mRemoval complete.\e[0m\n"
sleep 0.5
echo -e "\e[0;32mScript finished: assembled, linked, and ran successfully!\e[0m\n"

