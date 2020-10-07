class MovieResults 
  def initialize
    @tmdb = TmdbService.new
    @omdb = OmdbService.new
  end

  def best_by(actor)
    data_list = @tmdb.get_best_by_actor(actor)[:results]
    data_list = get_trailers(data_list)
    data_list = get_omdb_data(data_list)
    create_movies(data_list)
    create_actors(data_list)
    create_directors(data_list)
  end

  def worst_by(actor)
    data_list = @tmdb.get_worst_by_actor(actor)[:results]
    data_list = get_trailers(data_list)
    data_list = get_omdb_data(data_list)
    create_movies(data_list)
    create_actors(data_list)
    create_directors(data_list)
  end

  def create_movies(list)
    list.each do |data|
      if !existing_movie(data[:title])
        Movie.create(new_movie_params(data))
      end
    end
  end

  def create_actors(movie_list)
    movie_list.each do |movie|
      cast = movie[:cast].split(', ')
      cast.each do |actor|
        add_actor_to_movie(movie, actor)
      end
    end
  end

  def add_actor_to_movie(movie, actor)
    if !existing_actor(actor)
      Movie.find_by(title: movie[:title]).actors.create(name: actor)
    else 
      Movie.find_by(title: movie[:title]).actors << Actor.find_by(name: actor)
    end
  end

  def create_directors(movie_list)
    movie_list.each do |movie|
      directors = movie[:director].split(', ') 
      directors.each do |director|
        add_director_to_movie(movie, director)
      end
    end
  end

  def add_director_to_movie(movie, director)
    if !existing_director(director)
      Movie.find_by(title: movie[:title]).directors.create(name: director)
    else 
      Movie.find_by(title: movie[:title]).directors << Director.find_by(name: director)
    end
  end

  def get_trailers(movie_list)
    movie_list.each do |movie|
      data = @tmdb.get_trailer(movie[:id])
      movie[:imdb_id] = data[:imdb_id]
      trailer = data[:videos][:results].find {|video| video[:type] == "Trailer"}
      movie[:trailer] = trailer[:key] if trailer
      movie[:trailer] = "empty" if !trailer
    end
  end

  def get_omdb_data(movie_list)
    movie_list.each do |movie|
      data = @omdb.get_movie_data(movie[:imdb_id])
      movie[:imdb] = data[:imdbRating]
      movie[:metacritic] = data[:Metascore]
      movie[:rotten] = data[:Ratings][1][:Value] if data[:Ratings][1]
      movie[:cast] = data[:Actors]
      movie[:rated] = data[:Rated]
      movie[:year] = data[:Year]
      movie[:genre] = data[:Genre]
      movie[:director] = data[:Director]
    end
  end

  def new_movie_params(data)
    {
      title: data[:title],
      year: data[:release_date],
      rating: data[:vote_average],
      imdb: data[:imdb],
      rotten: data[:rotten],
      metacritic: data[:metacritic],
      trailer: data[:trailer],
      imdb_id: data[:imdb_id],
      poster: "https://image.tmdb.org/t/p/w200/#{data[:poster_path]}",
      description: data[:overview],
      rated: data[:rated],
      genre: data[:genre],
    }
  end

  def existing_movie(movie_title)
    Movie.find_by(title: movie_title)
  end
  def existing_actor(actor_name)
    Actor.find_by(name: actor_name)
  end
  def existing_director(director_name)
    Director.find_by(name: director_name)
  end

end