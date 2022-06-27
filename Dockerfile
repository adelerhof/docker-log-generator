# Dockerfile to create image with cron services
FROM ubuntu:latest
LABEL org.opencontainers.image.authors="blaataap"


# Add the script to the Docker Image
ADD gen-files.sh /root/gen-files.sh

# Give execution rights on the cron scripts
RUN chmod 0644 /root/gen-files.sh

#Install Cron
RUN apt-get update
RUN apt-get -y install cron

# Add the cron job
RUN crontab -l | { cat; echo "/5 * * * * bash /root/gen-files.sh"; } | crontab -

# Run the command on container startup
CMD cron