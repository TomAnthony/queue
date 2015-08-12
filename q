#!/bin/sh

usage() { echo "Usage: $0 [-t] [<queue>]" 1>&2; exit 1; }

TRIGGER=false
QUEUE="default"

while getopts "t" o; do
    case "${o}" in
        t) TRIGGER=true ;;
        *) usage ;;
    esac
done
shift $((OPTIND-1))

if [ ! -z "$1" ]; then
    QUEUE=$1
fi

if [ ! -p "/tmp/q_$QUEUE" ]; then
    mkfifo "/tmp/q_$QUEUE"
fi

if $TRIGGER; then
    echo > /tmp/q_$QUEUE
else
    read < /tmp/q_$QUEUE
fi