# Introduction

I've created a basic person matching API, which can search through users and create a basic list of recomended matches for a user.

Please see README.md for instructions on running the code.

# Use Cases

We need to be able to:
  - Add Users
  - Remove Users
  - Update Users
  - Add User Preferences
  - Update User Preferences
  - Remove User Preferences
  - Get Recomended Matches for a User.

In the future, this application would also need to:
  - Allow a User to Like another User
  - Allow a User to remove their Likes
  - Register a Match for two Users with mutual Likes
  - Remove Matches

# Architecture

To make the system platform independent, I've used Docker. This allows each sections of the architecture to run independently, and means the same code can run on Windows, Mac or Linux. To see this setup, look at the "docker-compose.yml" file. The mariadb data is stored in a Docker volume, which means it is persistent.

The system needs an API interface, and a database. There is a need for a frontend interface, such as a mobile and web client.

For the database, I used MariaDB. This is the solution used at Grazer, and it's a highly performant opensource database.

For the REST API, I used Ruby on Rails. I have more experience with Ruby on Rails than Go, and Ruby on Rails is an excellent tool for backend APIs.


# Database Tables
It is likely Preferences will be updated considerably more frequently than the User information, so I have created two tables with a foregin key linking them.

Users:
```
name, gender, locationX, locationY, diet_type, age
String, String, Decimal, Decimal, String, Integer
```
Preferences:
```
user_id,looking_for_diet_type, lower_age, upper_age, distance, gender
Integer,String, Integer, Integer, Decimal, String
```

As a future update, "age" should be replaced with "Birthday" and "Location" should be updated to use Latitude and Longitude.

These tables also contain an ID, updated timestamp, and created timestamp. These are used to access and update the information for most tables with Ruby On Rails.

# API

The API implements a CRUD REST api for Users and Preferences.

The API also implements a url "recommendations/:id" to find recommendations for a user with the given ID. This searches the database for matching user records.

The API requires more pattern checking than is currently implemented. In paticualr, fields such as "diet_type" which are used as search terms should be limited to specific values. Withot checks on these fields, a user with a diet of "veganism" will not match with a user searching for "Vegan".

The API returns results in JSON at the moment, but an API specification would need to be developed with the front end, and a data structure chosen to encapsulate the messages. The api currently expects url params, but this could be changed to use a JSON input.

The API should be mostly thread safe, and allow running multiple Docker containers of the Backend connected to the same DB to increase throughput.