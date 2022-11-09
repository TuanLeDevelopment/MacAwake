#!/bin/bash
SUDO=""
(( $EUID > 0 )) && SUDO="sudo -n"
function finish {
    $SUDO pmset disablesleep 0
    printf "\nSleep is back"
}
$SUDO pmset disablesleep 1 || exit
trap finish EXIT
printf "Sleep is gone, (Ctrl+C) to re-enable\n"
while :
	do sleep 1000
done
