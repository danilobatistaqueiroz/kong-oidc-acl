# FROM postgres:9.6

# COPY docker-entrypoint2.sh /usr/local/bin/

# ENTRYPOINT ["docker-entrypoint.sh", "docker-entrypoint2.sh"]
# CMD ["postgres"]

FROM postgres:11-alpine
COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh