# Grazer Take Home Test

## Dependencies:
- Docker

To facilitate deployment in multpile environments, docker has been used. Each service runs in a seperate docker container, making it easy to run anywhere, and reduce dependencies.

## To run:
docker compose build
docker compose up -d

This will create a rail api running on localhost:3000
The MariaDB container takes a long time to create (around 3 min), the api should wait until it is running to start.

Initial data (2 users) is seeded into the db.

### Test
Test with
* docker exec -it grazer-api bash -c "bin/rails test"

