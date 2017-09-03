FROM debian:stretch
ENV PYTHONUNBUFFERED 1

RUN useradd -m oioioi
COPY oioioi /sio2/oioioi

COPY sudo.sh /tmp
RUN /tmp/sudo.sh

USER oioioi
WORKDIR /sio2

COPY build.sh /tmp
RUN /tmp/build.sh

COPY settings.py /sio2/deployment/settings.py

COPY wait-for-it.sh /sio2
COPY run.sh /sio2

CMD ["bash", "run.sh"]
