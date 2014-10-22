# Gatling 2.0.0

FROM dockerfile/java:oracle-java8

# working directory for gatling
WORKDIR /opt

# create directory for gatling install
RUN mkdir -p gatling

# install gatling
RUN mkdir -p /tmp/downloads && \
	curl -sf -o /tmp/downloads/gatling-2.0.0.zip \
	-L http://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts/2.0.0/gatling-charts-highcharts-2.0.0-bundle.zip && \
	mkdir -p /tmp/archive && cd /tmp/archive && \
	unzip /tmp/downloads/gatling-2.0.0.zip && \
	mv /tmp/archive/gatling-charts-highcharts-2.0.0/* /opt/gatling/

# change context to gatling directory
WORKDIR  gatling

# enable directories below to be mountable from host
VOLUME ["/opt/gatling/conf","/opt/gatling/results","/opt/gatling/user-files"]

# update environment variables
ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GATLING_HOME /opt/gatling