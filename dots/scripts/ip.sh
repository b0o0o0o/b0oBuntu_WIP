#!/bin/bash
echo -e "\n\e[1;32mIP local\e[0m : $(ip -br a | cut -d/ -f1 |grep wlp1 | awk '{print $NF}')   -   \e[1;32mIP public\e[0m : $(curl -sS ipinfo.io | grep '"ip":' | cut -d '"' -f4 )"
echo -e "\n"
ip -br --color a | cut -d/ -f1
