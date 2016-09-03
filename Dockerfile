FROM jfloff/alpine-python:2.7
MAINTAINER Cameron Braid <cameron@drivenow.com.au>

RUN mkdir /plugin
COPY get.sh /plugin
COPY newrelic-glusterfs-monitoring /plugin
WORKDIR /plugin
ENV NEW_RELIC_LICENSE_KEY
COPY newrelic-agent.cfg /plugins/newrelic-agent.cfg
RUN sed -i -e 's/^license_key=.*$/license_key=$NEW_RELIC_LICENSE_KEY/g' -e 's/^file=\/tmp\/nfs-pluggin.log//file=/dev/stdout/g'
CMD newrelic-glusterfs-monitoring
