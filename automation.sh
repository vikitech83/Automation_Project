#!/bin/bash
# step 1,2,3
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install apache2
sudo systemctl status apache2
sudo service apache2 start
sudo systemctl status apache2

# step 4

LOG_DIR=”/var/logs/apache2”
DEST_DIR=“/tmp” LOG_TAG=”*.log”
TIMESTAMP=`date+`
LOGFILE="/path/to/log.log"
myname="vikram"
timestamp=$(date '+%d%m%Y-%H%M%S')

( cp “${LOG_DIR}” “${DEST_DIR}”;cd “${DEST_DIR}”|| exit find . -name *.log -type f -mtime +7 | xargs tar cvzf ${DEST_DIR}/${myname}-apache-logs-${timestamp}.tar )

#step 5,step6 Installing awscli
sudo apt update
sudo apt install awscli

aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
