#!/bin/bash 

#set -x

# [Description]
# Get to attribute value of "project"  for  specified xml file.
# *Target: Repo manifest file.
#
# $1 --> specify file
# $2 --> specify search value


FILE=$1
SEACH_VALUE=$2

if [[ -z ${FILE} ]] || [[ -z ${SEACH_VALUE} ]]; then
  echo "Please specify argument"
  exit 1
fi

CHECK_TARGET=$(cat ${FILE} | grep "${SEACH_VALUE}=" ) 

if [[ -z ${CHECK_TARGET} ]]; then

  echo "No exist of attribute name for specified argument in file"
  exit 1

else

  cat ${FILE} \
	| grep "<project" \
	| sed "s/\s*<project.*${SEACH_VALUE}=\"//g" \
	| sed "s/\".*//g"

fi

#set +x
