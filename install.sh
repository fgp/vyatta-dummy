#!/bin/sh

DATADIR=/opt/vyatta/share

mkdir -p "${DESTDIR}${DATADIR}/vyatta-cfg/templates"
cp -ar templates-cfg/* "${DESTDIR}${DATADIR}/vyatta-cfg/templates"

mkdir -p "${DESTDIR}/etc/insserv/overrides"
cp -ar debian/insserv.overrides.miredo "${DESTDIR}/etc/insserv/overrides"
