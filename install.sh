#!/bin/sh

DATADIR=/opt/vyatta/share
SBINDIR=/opt/vyatta/sbin

mkdir -p "${DESTDIR}${DATADIR}/vyatta-cfg/templates"
cp -ar templates-cfg/* "${DESTDIR}${DATADIR}/vyatta-cfg/templates"

mkdir -p "${DESTDIR}${SBINDIR}"
cp -a scripts/vyatta-update-miredo "${DESTDIR}${SBINDIR}"

mkdir -p "${DESTDIR}/etc/insserv/overrides"
cp -ar debian/insserv.overrides.miredo "${DESTDIR}/etc/insserv/overrides"
