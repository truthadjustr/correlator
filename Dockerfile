FROM docker.elastic.co/logstash/logstash-oss:6.0.0
LABEL maintainer="truthadjustr@gmail.com"

RUN  logstash-plugin install logstash-output-gelf logstash-output-syslog
EXPOSE 5140/udp
CMD ["/usr/share/logstash/bin/logstash"]
