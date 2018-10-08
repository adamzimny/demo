#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    echo "Usage:"
    echo "$0 [env] stream_id"
    echo "e.g.:"
    echo "   $0 default 55f4d410-4511-4cb7-a7c3-a65b97a7c600"
    echo "THIS SCRIPT WORKS ONLY IF output=json IN ~/.aws/config"
    exit 1
fi

case $1 in
    default)
        lgn=/aws/codebuild/continuousdelivery-java-reference
        lsn=$2
        profile=default
        ;;
    *)
        echo "Unknown environment $1"
        exit 1
esac

# grep message - display only log messages (skip meta info)
# sed -e "s/\"\\\t//"  - remove leading "\t"
# sed -e "s/\",$//" - remove trailing ",
aws --profile $profile logs get-log-events --log-stream-name $lsn --log-group-name $lgn | grep message | sed -e "s/ *\"message\"://" | sed -e "s/\"\\\t//" | sed -e "s/\",$//"
echo aws --profile $profile logs get-log-events --log-stream-name $lgn/$2 --log-group-name /$lgn
