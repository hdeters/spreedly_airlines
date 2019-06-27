# README

## Setup
* Copy `.env.example` to `.env` and replace secrets
* You'll need a local postgres DB for the flights. Edit `config/database.yml` with your postgres user creds.
* Create the DB: `rake db:create db:schema:load db:seed`
* `Rails s` to run the app on `http://localhost:3000/`