#!/bin/bash

UPF="userpass.txt"

vpn_verify() {
  LOGIN="$1"
  PASSWORD="$2"
  AUTHL=()

  if [ ! ${LOGIN} ] || [ ! ${PASSWORD} ]; then echo "[ERROR]: No username/password provided."; exit 1; fi

  while IFS=: read LL PP
    do
      AUTHL+=("$LL:$PP")
    done < "${UPF}"

  for i in ${AUTHL[@]}; do
    if [ "${i}" == "${LOGIN}:${PASSWORD}" ]; then
        exit 0
    fi
  done
}

if [ ! $1 ] || [ ! -e $1 ]; then echo "[ERROR]: No file found."; exit 1; fi
vpn_verify `cat $1`
exit 1
