#FROM centos:7
## CA Adeo test et prod
#RUN curl -o /etc/pki/ca-trust/source/anchors/ADEO_ROOT_CA1.crt http://igc.groupeadeo.com/ADEO_ROOT_CA1.crt
#RUN curl -o /etc/pki/ca-trust/source/anchors/ADEO_SERVICES_INFRA_CA1.crt http://igc.groupeadeo.com/ADEO_SERVICES_INFRA_CA1.crt
#RUN curl -o /etc/pki/ca-trust/source/anchors/ADEO_SERVICES_INFRA_CA2.crt http://igc.groupeadeo.com/ADEO_SERVICES_INFRA_CA2.crt
#RUN curl -o /etc/pki/ca-trust/source/anchors/TEST_ADEO_ROOT_CA1.crt http://igc.groupeadeo.com/recette/TEST_ADEO_ROOT_CA1.crt
#RUN curl -o /etc/pki/ca-trust/source/anchors/TEST_ADEO_SERVICES_INFRA_CA3.crt http://igc.groupeadeo.com/recette/TEST_ADEO_SERVICES_INFRA_CA3.crt
#RUN curl -o /etc/pki/ca-trust/source/anchors/TEST_ADEO_SERVICES_INFRA_CA4.crt http://igc.groupeadeo.com/recette/TEST_ADEO_SERVICES_INFRA_CA4.crt
#RUN update-ca-trust

#RUN mkdir /prometheus-pingdom-exporter
#COPY ./* /prometheus-pingdom-exporter/

#RUN groupadd -g 1111 adeo && adduser -g 1111 -d / -u 1111 adeo

##RUN chown -R adeo.adeo /prometheus-pingdom-exporter
#USER 1111
##############
FROM alpine:3.8
MAINTAINER Joseph Salisbury <joseph@giantswarm.io>

#COPY ./prometheus-pingdom-exporter /prometheus-pingdom-exporter

RUN apk update && apk add ca-certificates

EXPOSE 8000

ENTRYPOINT ["/prometheus-pingdom-exporter"]
