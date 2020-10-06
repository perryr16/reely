class MovieResults 
  def initialize
    @service = TmdbService.new
  end

  def best_by(actor)
    data_list = @service.get_best_by_actor(actor)[:results]
    data_list = get_trailers(data_list)
    create_movies(data_list)
  end

  def worst_by(actor)
    data_list = @service.get_worst_by_actor(actor)[:results]
    data_list = get_trailers(data_list)
    create_movies(data_list)
  end

  def create_movies(list)
    list.each do |data|
      Movie.create(new_movie_params(data))
    end
  end

  def get_trailers(movie_list)
    movie_list.each do |movie|
      data = @service.get_trailer(movie[:id])
      movie[:imdb_id] = data[:imdb_id]
      trailer = data[:videos][:results].find {|video| video[:type] == "Trailer"}
      movie[:trailer] = trailer[:key] if trailer
      movie[:trailer] = "empty" if !trailer
    end
  end

  def new_movie_params(data)
    {
      title: data[:title],
      year: data[:release_date],
      rating: data[:vote_average],
      # imdb: data[:imdb],
      # rotten: data[:rotten],
      # metacritic: data[:metacritic],
      trailer: data[:trailer],
      imdb_id: data[:imdb_id],
      poster: data[:poster_path],
      description: data[:overview],
    }
  end

end