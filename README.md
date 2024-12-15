# Grazer Take Home Test
James Murray

Please see DESIGN.md for an overview of the design.

## Dependencies:
- Docker

To facilitate deployment in multpile environments, docker has been used. Each service runs in a seperate docker container, making it easy to run anywhere, and reduce dependencies.

## To run:
```
docker compose build
docker compose up -d
```

This will create a rail api running on localhost:3000

The MariaDB container takes a long time to create (around 3 min), the api should wait until it is running to start.

Initial data (2 users) is seeded into the db.

Test data is seeded from the ./test/fixtures folder

### Test
Test with
```
docker exec -it grazer-api bash -c "bin/rails test"
```

There are tests for the models in ./test/models, but the main tests for the api are in ./test/controllers. These test each controller (the Users CRUD, the preferences CRUD, and the recommendation finder).