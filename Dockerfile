# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install sudo && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean && \
    sudo su && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd
# Expose the web-based terminal port
EXPOSE 4200

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]



