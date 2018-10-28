FROM ubuntu:18.04
MAINTAINER Pedro Coca <pedro.coca@gmail.com>

# Install and PostgreSQL server
RUN apt-get update && apt-get install -y postgresql postgresql-client postgresql-contrib

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-10`` package when it was ``apt-get installed``
USER postgres

# Start the PostgreSQL server and create a PostgreSQL role (superuser) and then create a database `demo` owned by the ``superuser`` role.
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER superuser WITH SUPERUSER PASSWORD 'superuser';" &&\
    createdb -O superuser demo

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  password" >> /etc/postgresql/10/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/10/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/10/bin/postgres", "-D", "/var/lib/postgresql/10/main", "-c", "config_file=/etc/postgresql/10/main/postgresql.conf"]
