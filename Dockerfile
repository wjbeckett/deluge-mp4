FROM linuxserver/deluge
MAINTAINER wjbeckett

# Install Git
RUN apk add --no-cache git

# Install MP4 Automator
RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /scripts/MP4_Automator
RUN apk add --no-cache \
  py-setuptools \
  py-pip \
  python-dev \
  libffi-dev \
  gcc \
  musl-dev \
  openssl-dev \
  ffmpeg
RUN pip install --upgrade PIP
RUN pip install requests
RUN pip install requests[security]
RUN pip install requests-cache
RUN pip install babelfish
RUN pip install "guessit<2"
RUN pip install "subliminal<2"
RUN pip install qtfaststart
RUN pip install gevent
# As per https://github.com/mdhiggins/sickbeard_mp4_automator/issues/643
ONBUILD RUN pip uninstall stevedore
ONBUILD RUN pip install stevedore==1.19.1

#Set script file permissions
RUN chmod 775 -R /mp4automator

#Adding Custom files
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh

VOLUME /mp4automator
