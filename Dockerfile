FROM jfloff/alpine-python:2.7-onbuild
MAINTAINER Cameron Braid <cameron@drivenow.com.au>

RUN mkdir -p /etc/newrelic/
COPY get.sh /etc/newrelic/
COPY newrelic-glusterfs-monitoring /etc/newrelic/
WORKDIR /etc/newrelic/
ENV NEW_RELIC_LICENSE_KEY=''
COPY newrelic-agent.cfg /etc/newrelic/newrelic-agent.cfg
RUN sed -i /etc/newrelic/newrelic-agent.cfg -e "s/^license_key=.*$/license_key=$NEW_RELIC_LICENSE_KEY/g" -e "s/^file=\/tmp\/nfs-pluggin.log/file=\/dev\/stdout/g"
CMD newrelic-glusterfs-monitoring
