#!/bin/bash

DATE=$(date +"%d-%m-%Y_%H%M%S")
SOURCE_LOGS=/home/avr/logs
cd ${SOURCE_LOGS}
for i in {1..20}; do dd if=/dev/urandom bs=1M count=1 of=file$DATE$i; done
