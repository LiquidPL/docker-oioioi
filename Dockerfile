FROM python:2.7
ENV PYTHONUNBUFFERED 1

RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    texlive-latex-base \
    texlive-lang-polish \
    texlive-latex-extra \
    texlive-fonts-recommended \
    lighttpd \
    rabbitmq-server \
    libstdc++6:i386 \
    zlib1g:i386 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m oioioi

COPY oioioi /home/oioioi/oioioi
RUN chown -R oioioi:oioioi /home/oioioi/oioioi

USER oioioi
WORKDIR /home/oioioi

COPY setup.sh .
RUN ./setup.sh
