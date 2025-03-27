sudo -i -u postgres
psql
CREATE USER kong; CREATE DATABASE kong OWNER kong; ALTER USER kong WITH password 'kong';
\q
exit