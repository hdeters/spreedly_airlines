# README

## Setup
* Copy `.env.example` to `.env` and replace secrets
* You'll need a local postgres DB for the flights. Edit `config/database.yml` with your postgres user creds.
* Create the DB: `rake db:create db:schema:load db:seed`
* `Rails s` to run the app on `http://localhost:3000/`

## Notes
* This exercise acted as a much needed ruby refresher/intro to rails as much as anything. So any feedback on that front is much appreciated. 
* I didn't have too many problems following along with the docs. I initially went with the Express integration outlined in the 'Basics' section of the docs which worked pretty well to get me up and running. I did get a little confused when it came to the PMD bit. At first I didn't realize I needed to create the specific receiver and then during creation I wasn't sure what the `credentials` bit of the payload was supposed to be. Eventually I gathered that this creation process probably varies greatly between receivers and that I could have left out the credentials bit for my purposes. 
* I also spent a good amount of time pinpointing exactly which transactions call to make in order to get what I needed. There's a broad 'Transactions' section of the docs and I started with that `list` functionality but it didn't have everything I needed. Then I realized there were nested transactions endpoints within gateways and payment methods. That probably goes along with developing a larger framework of all of this in my head. It makes perfect sense now but was somewhat tricky to navigate at first glance. 
* Once I had a good grasp on how the docs are organized and how to navigate them I was able to implement the saved cards/forget card functionality pretty quickly. So that speaks well to how the docs are organized in general -- the learning curve there was fairly logarithmic. 