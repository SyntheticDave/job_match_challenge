# README

This is a skeleton rails application for the Job Match Coding Challenge.
It is recommended that you use this application as a starting point for your solution.
Docker configuration has been provided to make it easy to run the application locally.
You don't need to use Docker, but it is recommended to avoid any issues with your local environment.

## Getting Started

### With Docker

Ensure is installed [Docker](https://docs.docker.com/docker-for-mac/install/) to run in a container.

Once Docker is installed on your system, you can use the following commands from the root of the application folder, e.g `/var/www/job_match_test`:

###### Build images:

`docker compose build`

###### Setup database:

`docker compose run --rm web bin/setup`

###### Run containers in background:

`docker compose up -d`
Open `http://localhost:3000/` in your browser.

###### Bundle install:

`docker compose run --rm web bundle install`

##### Get a Bash Session

`docker compose run --rm web /bin/bash`

This will spin up a new container and give you a bash session inside that container.
From here you can get a rails console, run migrations, run specs, etc.

---

## TODO

* Provide seed data
* Provide factories or fixtures for tests
* Consider whether to provide base views and controllers.
  * Don't want to waste candidates time on boilerplate, but also don't want to constrain them to a particular approach.
  * May be that creating views and controllers is the junior version of the challenge?