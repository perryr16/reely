# ABOUT

Reely is an app that allows users to quickly search for an actor or directors best (or even better, their worst) movies

Reely is a self-made app designed to make couch time more enjoyable in 2020. Searching for movies in the pandemic era has just gotten easier. Normal google searches, or lengthy movie blogs rarely have all the information you need in one place. Reely aggregates data from the Open Movie Database (OMDB) and The Movie Database (TMDB) API's to put the important information right in front of the user. A user can search for an actor or director's best films. Or if you want a good laugh, users can sort by their worst films. Films are ordered based on their IMDB rating. 

Results include which popular streaming sites (Netflix, HBO, Amazon...) have access to the film.

Users can create a profile where they can save movies to be watched. After watching users can remove the films from their saved profile. Users also have the ability to comment on films.

# Software Requirements
* Ruby Version 2.5.3
* Rails Version 6.03.3

# Getting Started 
If you want to create your own Reely and make any additional improvements or add extenstions. Follow these steps.

```
git clone git@github.com:perryr16/reely.git
```

Once the repository has been downloaded to your local machine. Run the following commands:

```
bundle install
rails db:create
rails db:migrate
```

# Running Locally
To start a local server enter the following command 
`rails s`
navigate to `localhost:3000` in your browser to see the app running locally

# Running Tests
The test suite is run using RSpec and Capybara. The test results have been mocked and stubbed using Webmock and VCR. To run all tests simply enter the following commands.

`rails g rspec:install`
`bundle exec rake db:create` (if you have not run the commands in getting started)
`bundle exec rspec`


## Schema

Movies
- have many actors
- have many directors
- have many UserMovies
- title 
- year 
- rating
- imdb 
- rotten 
- metacritic
- trailer id 
- poster id
- description
- genre


Actors
- have many movies
- name 
- imdb_id

MovieActors
- belongs to actors
- belongs to movies 

Directors 
- have many movies 
- name 
- imdb_id

MovieDirectors
- belongs to directors
- belongs to movies 

Users
- have many movies
- have many comments 

UserMovies 
- belong to users 
- belong to movies

Comments
- belong to movies
- belong to users
