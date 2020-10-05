# ABOUT

Reely is an app that allows users to quickly search for an actor or directors best (or even better, their worst) movies

# Schema

Movies
- have many persons
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


Person
- have many movies
- name 

MoviePerson
- belongs to person
- belongs to movies 
- role (actor, director)
