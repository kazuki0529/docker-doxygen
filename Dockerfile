FROM debian

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG VERSION_PLANTUML='1.2019.8'

ENV http_proxy=${HTTP_PROXY} \
    https_proxy=${HTTPS_PROXY} \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    texlive-lang-japanese texlive-lang-cjk texlive-fonts-recommended texlive-fonts-extra \
    make wget python default-jdk doxygen graphviz xdvik-ja \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# plantuml
RUN mkdir -p /opt/plantuml \
  && wget -O /opt/plantuml/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.$VERSION_PLANTUML.jar/download --no-check-certificate

WORKDIR /data
VOLUME ["/data"]

CMD ["/bin/bash", "/data/build.sh"]
