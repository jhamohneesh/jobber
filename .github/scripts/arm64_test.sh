apk update
apk upgrade
apk add make
apk add alpine-sdk
apk add go
apk add su-exec

adduser -G abuild -D jobber
su jobber -c "abuild-keygen -an"
find "/home/jobber/.abuild" -name '*.rsa.pub' -exec mv {} /etc/apk/keys/ ';'
chown root:root /etc/apk/keys/*
chmod a+w . packaging/alpine
su jobber -c "make -C packaging/alpine pkg-local DESTDIR=/root/runner/pkgs/"
