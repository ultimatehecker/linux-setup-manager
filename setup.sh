#!/bin/bash

. installers/rhel.sh
. installers/debian.sh
. installers/arch.sh

PS3="Select your operating system please: "

select lng in Debian RHEL Arch Quit
do
    case $lng in
        "Debian")
            install_debian;;
        "RHEL")
            install_rhel;;
        "Arch")
           install_arch;;
        "Quit")
           echo "Goodnight"
           break;;
        *)
           echo "Ooops, that option doesn't seem to exist! Please select a number 1-4.";;
    esac
done

