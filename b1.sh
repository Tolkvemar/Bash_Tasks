#!/bin/bash

    if  [ -n "$1" ] ; then # Если скрипт запущен с ключем то:
        if [ "$1" = "--all" ]; then  # проверка ключа -> действие
            subnetlist=$(ip route | grep -Ev 'default' | awk '{print $1}')
            for subnet in $subnetlist; do
                varsubnet="${subnet}"
                nmap -sn --open $varsubnet | grep "Nmap scan report for" | awk '{print $5 $6}'
            done
#nmap -sn --open  192.168.13.0/24 | grep "Nmap scan report for" | awk '{print $5 $6}'
        fi

        if [ "$1" = "--target" ]; then  # проверка ключа -> действие
            netstat -tlnp
        fi
    else

    echo "Options:"
    echo "	--all		displays the IP addresses of all hosts in the current subnet."
    echo "	--target	displays a list of open system TCP ports."
    fi
