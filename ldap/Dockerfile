FROM ubuntu:18.04
MAINTAINER Pedro Coca <pedro.coca@gmail.com>

RUN groupadd -r openldap
RUN useradd -r -g openldap openldap

# Install OpenLDAP, ldap-utils and ssl-tools 
RUN echo "path-include /usr/share/doc/krb5*" >> /etc/dpkg/dpkg.cfg.d/docker && apt-get -y update \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       ldap-utils \
       libsasl2-modules \
       libsasl2-modules-db \
       libsasl2-modules-gssapi-mit \
       libsasl2-modules-ldap \
       libsasl2-modules-otp \
       libsasl2-modules-sql \
       openssl \
       slapd \
       krb5-kdc-ldap \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose default ldap and ldaps ports
EXPOSE 389 636

COPY sample_load.ldif

CMD ["sh", "-c", "slapd -h 'ldap:/// ldapi:///' -u openldap -g openldap"]
