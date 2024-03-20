FROM tomcat:9-jre11

ENV TZ="Asia/Oral"

RUN apt-get -y update \
&& echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
&& apt-get --no-install-recommends --no-install-suggests --allow-unauthenticated -y install \
                  libreoffice \
                  ttf-mscorefonts-installer \
                  curl \
                  gnupg2 \
                  apt-utils \
                  nginx \
&& fc-cache -f -v \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /var/lib/apt-get/lists/*

RUN libreoffice --version