FROM linuxserver/deluge
LABEL maintainer="wjbeckett"

# Update package repositories
RUN apt-get update

# Install MP4 Automator
RUN apt-get install -y \
  python-setuptools \
  python-pip \
  git \
  ffmpeg
RUN pip install --upgrade PIP
RUN pip install requests
RUN pip install requests[security]
RUN pip install requests-cache
RUN pip install babelfish
RUN pip install 'guessit<2'
RUN pip install 'subliminal<2'
RUN pip uninstall -y stevedore
RUN pip install stevedore==1.19.1
RUN pip install qtfaststart
RUN pip install deluge-client
RUN pip install gevent
RUN git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git mp4automator

#Set script file permissions
RUN chmod 775 -R /mp4automator

#Adding Custom files
ADD init/ /etc/cont-init.d/
RUN chmod -v +x /etc/cont-init.d/*.sh

VOLUME /mp4automator
