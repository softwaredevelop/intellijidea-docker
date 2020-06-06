ARG MAVEN_VERSION

FROM maven:${MAVEN_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    openjfx \
    libxtst-dev \
    libxext-dev \
    libxrender-dev \
    libfreetype6-dev \
    libfontconfig1 \
    libgtk2.0-0 \
    libxslt1.1 \
    libxxf86vm1 \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

ARG INTELLIJIDEA_VERSION
ARG INTELLIJIDEA_DOWNLOAD_URL=https://download-cf.jetbrains.com/idea/ideaIC-${INTELLIJIDEA_VERSION}.tar.gz
ENV INTELLIJIDEA_DOWNLOAD_URL ${INTELLIJIDEA_DOWNLOAD_URL}

RUN wget --output-document=intellijidea-community.tar.gz ${INTELLIJIDEA_DOWNLOAD_URL} \
    && mkdir --parents /opt/intellijidea-community \
    && tar -xzf intellijidea-community.tar.gz --directory=/opt/intellijidea-community --strip-components=1 \
    && rm intellijidea-community.tar.gz \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["/opt/intellijidea-community/bin/idea.sh"]
