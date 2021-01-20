# ABOUT

Reely is an app that allows users to quickly search for an actor or directors best (or even better, their worst) movies

Reely is a self-made app designed to make couch time more enjoyable in 2020. Searching for movies in the pandemic era has just gotten easier. Normal google searches, or lengthy movie blogs rarely have all the information you need in one place. Reely aggregates data from the Open Movie Database (OMDB) and The Movie Database (TMDB) API's to put the important information right in front of the user. A user can search for an actor or director's best films. Or if you want a good laugh, users can sort by their worst films. Films are ordered based on their IMDB rating. 

Results include which popular streaming sites (Netflix, HBO, Amazon...) have access to the film.

Users can create a profile where they can save movies to be watched. After watching users can remove the films from their saved profile. Users also have the ability to comment on films.

# Getting Started
* Ruby Version 2.5.3

# Schema

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
