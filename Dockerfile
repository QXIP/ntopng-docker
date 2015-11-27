FROM ubuntu:14.04
MAINTAINER L. Mangani <mangani@ntop.org>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Update & Install from NTOP Package
RUN apt-get update -y -q && apt-get -y -q install curl
# install from ntop development builds
RUN curl -s --remote-name http://apt.ntop.org/14.04/all/apt-ntop.deb
RUN sudo dpkg -i apt-ntop.deb
RUN rm -rf apt-ntop.deb

# Install nProbe
RUN apt-get update
RUN apt-get -y -q install ntopng

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

# Run & Obtain ID
RUN ntopng


