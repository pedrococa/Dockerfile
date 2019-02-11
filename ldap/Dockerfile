FROM osixia/openldap:1.2.3
MAINTAINER Pedro Coca <pedro.coca@gmail.com>

EXPOSE 389 636

COPY sample_load.ldif sample_load.ldif

# RUN ldapadd -x -H ldap://localhost -D "cn=admin,dc=mydemo,dc=run" -w admin -f sample_load.ldif

RUN service slapd start

This does not work:

5c614fc3 @(#) $OpenLDAP: slapd  (Dec 30 2018 18:24:00) $
	Debian OpenLDAP Maintainers <pkg-openldap-devel@lists.alioth.debian.org>
5c614fc3 could not stat config file "/etc/ldap/slapd.conf": No such file or directory (2)
5c614fc3 slapd stopped.
