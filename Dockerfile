FROM linuxserver/deluge
MAINTAINER wjbeckett

# additional files
##################

apk update
apk upgrade

apk add git
apk add ffmpeg

curl https://bootstrap.pypa.io/ez_setup.py -o - | python
easy_install pip


pip install requests 
pip install requests[security]
pip install requests-cache
pip install babelfish
pip install 'guessit<2'
pip install 'subliminal<2'
pip install stevedore
pip install python-dateutil
pip install deluge-client
pip install qtfaststart


##Get MP4Automator
[[ ! -d /mp4automator/.git ]] && (git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /mp4automator && chown -R abc:abc /mp4automator)

##Use .ini if present or copy sample
[[ ! -f /mp4automator/autoProcess.ini ]] && (cp /mp4automator/autoProcess.ini.sample /mp4automator/autoProcess.ini)

# test if updates have been disabled
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /mp4automator
git pull
chown -R abc:abc /config

VOLUME /mp4automator
