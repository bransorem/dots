FROM    ubuntu:14.04
MAINTAINER    Bran Sorem "contact@bransorem.com"

RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server