FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y calibre && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get autoremove -y

VOLUME ["/books"]
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh", "/books"]
