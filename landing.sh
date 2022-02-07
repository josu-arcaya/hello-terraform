#!/bin/bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

usage="usage: landing-script.sh [-h]  [-i] [-a] [-d]

This script serves as the entrypoint for the IEM

arguments:
  -h	show this help message and exit
  -i	init configuration
  -a	create or update infrastructure
  -d	destroy infrastructure"

init() {
  terraform init
}

apply() {
  terraform apply -auto-approve
}

destroy() {
  terraform destroy -auto-approve
}

while getopts "h?iad" opt; do
  case "$opt" in
    h|\?)
      echo "$usage"
      exit 0
      ;;
    i)  init
      ;;
    a)  apply
      ;;
    d)  destroy
      ;;
  esac
done
