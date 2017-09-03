FROM debian:stretch
ENV PYTHONUNBUFFERED 1

RUN useradd -m oioioi
COPY oioioi /home/oioioi/oioioi

COPY sudo.sh /tmp
RUN /tmp/sudo.sh

USER oioioi
WORKDIR /home/oioioi

COPY build.sh /tmp
RUN /tmp/build.sh

COPY settings.py /home/oioioi/deployment/settings.py

COPY wait-for-it.sh /home/oioioi
COPY run.sh /home/oioioi

CMD ["bash", "run.sh"]
