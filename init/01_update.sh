#!/bin/bash
apk update
apk upgrade
git -C /mp4automator/ reset HEAD --hard
git -C /mp4automator/ pull
chmod 775 -R /scripts
pip install --upgrade PIP
pip install --upgrade requests
pip install --upgrade requests[security]
pip install --upgrade requests-cache
pip install --upgrade babelfish
pip install --upgrade 'guessit<2'
pip install --upgrade 'subliminal<2'
pip install --upgrade qtfaststart
pip install --upgrade deluge-client
pip install --upgrade gevent
pip uninstall --yes stevedore
pip install stevedore==1.19.1
