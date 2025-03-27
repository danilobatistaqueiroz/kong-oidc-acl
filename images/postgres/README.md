docker run -d --name some-postgres \     
  -e POSTGRES_PASSWORD=post \
  -e POSTGRES_USER=post \
  -e POSTGRES_DB=post \
  -p 5432:5432 \
danilobatistaqueiroz/postgres:latest

psql --host=localhost --port=5432 --username=simha --password --dbname=btgapp