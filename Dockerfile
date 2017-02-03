# Docker file for ChRIS development environment

FROM fnndsc/ubuntu-python3:latest
MAINTAINER fnndsc "dev@babymri.org"

ENV APPROOT="/usr/src/chris_backend" REQPATH="/usr/src/requirements" VERSION="0.1"
COPY ["./requirements", "${REQPATH}"]

RUN apt-get update \
  && apt-get install -y libmysqlclient-dev dcmtk \
  && apt-get install -y libssl-dev libcurl4-openssl-dev \
  && apt-get install -y apache2 apache2-dev \
  && pip3 install -r ${REQPATH}/local.txt

WORKDIR $APPROOT
ENTRYPOINT ["python3", "manage.py"]
EXPOSE 8000
CMD ["runserver", "0.0.0.0:8000"]
