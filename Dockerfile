FROM ubuntu:14.04
MAINTAINER L. Mangani <mangani@ntop.org>

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Update & Install from NTOP Package
RUN apt-get update -y -q && apt-get -y -q install wget
# install from ntop development builds
RUN cd /tmp
RUN wget http://apt.ntop.org/14.04/all/apt-ntop.deb
RUN sudo dpkg -i apt-ntop.deb
RUN rm -rf apt-ntop.deb

# Install nProbe
RUN apt-get update
RUN apt-get install --no-install-recommends --no-install-suggests -yqq ntopng libpcap-dev libmysqlclient18 redis-server

COPY run.sh /
RUN sudo chmod +x /run.sh

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

# Run & Obtain ID
ENTRYPOINT ["/run.sh"]

