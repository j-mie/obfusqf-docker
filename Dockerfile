FROM phusion/baseimage:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Get unzip
RUN apt-get update && apt-get install -y unzip libcurl3

# Download ObfuSQF
ADD https://obfusqf.bytex.digital/downloads/ObfuSQF_CMD_x64.zip /root/

# Unzip ObfuSQF and move it to /bin/obfusqf
RUN cd /root && unzip ObfuSQF_CMD_x64.zip && mv ./ObfuSQF_CMD_x64.bin /bin/obfusqf && chmod +x /bin/obfusqf

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/obfusqf"]