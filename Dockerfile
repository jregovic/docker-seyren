FROM ubuntu:14.04
MAINTAINER Jim Regovich <jregovic@rego.org>

RUN apt-get update && apt-get clean && \
	apt-get install -q -y openjdk-7-jre-headless && \
	apt-get clean &&\
	mkdir -p /var/log/seyren && \
	mkdir -p /opt/seyren/conf && \
	mkdir -p /opt/seyren/bin 

COPY docker-entrypoint.sh /entrypoint.sh
COPY seyren.jar /opt/seyren
COPY seyren.sh /opt/seyren/bin
COPY seyren.conf /opt/seyren/conf

RUN	chmod 755 /entrypoint.sh && \
	chmod 755 /opt/seyren/bin/seyren.sh

ENTRYPOINT ["/entrypoint.sh"] 

EXPOSE 8080

CMD ["/opt/seyren/bin/seyren.sh"]
