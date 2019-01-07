FROM alpine:3.8
MAINTAINER Joseph Salisbury <joseph@giantswarm.io>



RUN apk update && apk add ca-certificates

RUN groupadd -g 1111 adeo && adduser -g 1111 -d / -u 1111 adeo
RUN mkdir /prometheus-pingdom-exporter
COPY ./* /prometheus-pingdom-exporter
RUN chown -R adeo.adeo /prometheus-pingdom-exporter
USER 1111

EXPOSE 8000

ENTRYPOINT ["/prometheus-pingdom-exporter"]
