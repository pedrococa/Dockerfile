FROM ubuntu:20.04
MAINTAINER Pedro Coca <pedro.coca@gmail.com>
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install and PostgreSQL server
RUN apt-get update && apt-get install -y postgresql postgresql-client postgresql-contrib

# Run the rest of the commands as the ``postgres`` user created by the ``postgresql`` package when it was ``apt-get installed``
USER postgres

# Start the PostgreSQL server and create a PostgreSQL role (superuser) and then create a database `demo` owned by the ``superuser`` role.
RUN /etc/init.d/postgresql start &&\
    psql --command "ALTER USER postgres WITH PASSWORD 'vaulttest';" &&\
    psql --command "CREATE DATABASE pgdbdemo;" &&\
    psql --command "CREATE TABLE wimbledon (id SERIAL PRIMARY KEY, player TEXT, year INTEGER);" pgdbdemo &&\
    psql --command "INSERT INTO wimbledon (player, year) VALUES ('Murray', 2016), ('Federer', 2017), ('Djokovic',2018);" pgdbdemo 

# Adjust PostgreSQL configuration so that remote connections to the database are possible.
RUN echo "host  all  all    0.0.0.0/0  password" > /etc/postgresql/12/main/pg_hba.conf
RUN echo "local all  all               password" >> /etc/postgresql/12/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/12/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/12/bin/postgres", "-D", "/var/lib/postgresql/12/main", "-c", "config_file=/etc/postgresql/12/main/postgresql.conf"]
