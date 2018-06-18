#!/bin/sh
# $1 ... mongo host to dump
# $2 ... destination gcs bucket

if [ -z $1 ]; then
	echo "error: specify mongodb host as first argument"
	exit 1
fi

if [ -z $2 ]; then
	echo "error: specify gcs bucket as second argument"
	exit 1
fi

if [ -z $GOOGLE_APPLICATION_CREDENTIALS ]; then
	echo "specify credentials json file"
	exit 1
fi

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
timestamp=$(date -u -Iseconds)
mongodump --host $1 --archive | \
	gsutil cp /dev/stdin gs://$2/dump-${timestamp}
