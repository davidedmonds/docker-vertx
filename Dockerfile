#
# Vert.x Dockerfile
#
# https://github.com/david.edmonds/docker-vertx
#
# forked from
# https://github.com/muraken720/docker-vertx
#

# Pull base image.
FROM dockerfile/java

MAINTAINER David Edmonds

# Install Vert.x
RUN apt-get install wget --no-install-recommends
RUN wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.tar.gz -P /tmp
RUN tar zxf /tmp/vert.x-2.1.tar.gz -C /usr/local/
ENV PATH $PATH:/usr/local/vert.x-2.1/bin

# Add app
ADD app /root/app
ADD vertxrun.sh /root/

# Expose
EXPOSE 8080

# Run
CMD ["/root/vertxrun.sh"]
