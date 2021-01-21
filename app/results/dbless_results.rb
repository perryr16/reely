class DblessResults
  def initialize
    @tmdb = TmdbService.new
    @omdb = OmdbService.new
  end

  def all_directed(director)
    data_list = @tmdb.get_all_by_director(director)
    data_list = get_trailers(data_list)
    data_list = get_omdb_data(data_list)
    movies = create_movie_list(data_list)
  end

  def best_directed(director)
    all_directed(director).sort_by {|m| m[:imdb].to_f}.reverse
  end

  def worst_directed(director)
    worst = all_directed(director).sort_by {|m| m[:imdb].to_f}
    filterd = worst.find_all {|movie| !movie[:imdb].nil?} 
  end
  
  def all_acted(actor)
    data_list = @tmdb.get_all_by_actor(actor)
    return if !data_list
    data_list = get_trailers(data_list)
    data_list = get_omdb_data(data_list)
    movie_list = create_movie_list(data_list)
  end


  def worst_acted(actor)
    all =  all_acted(actor)
    return if !all
    worst = all.sort_by {|m| m[:imdb].to_f}
    filterd = worst.find_all {|movie| !movie[:imdb].nil?} 
  end

  def best_acted(actor)
    all = all_acted(actor)
    return if !all
    all.sort_by {|m| m[:imdb].to_f}.reverse
  end

  def by_title(title)
    data_list = @tmdb.get_search_title(title)
    data_list = get_trailers(data_list)
    data_list = get_omdb_data(data_list)
    movie_list = create_movie_list(data_list)
    movie_list.sort_by {|m| m[:imdb].to_f}.reverse
  end


  def get_trailers(movie_list)
    movie_list.each do |movie|
      data = @tmdb.get_trailer(movie[:id])
      movie[:imdb_id] = data[:imdb_id]
      if data[:videos]
        trailer = data[:videos][:results].find {|video| video[:type] == "Trailer"}
        movie[:trailer] = trailer[:key] if trailer
      else
        movie[:trailer] = "empty" if !trailer
      end
    end
  end

   def get_omdb_data(movie_list)
    movie_list.each do |movie|
      data = @omdb.get_movie_data(movie[:imdb_id])
      movie[:imdb] = data[:imdbRating]
      movie[:metacritic] = data[:Metascore]
      movie[:rotten] = rotten_rating(data)
      movie[:cast] = data[:Actors]
      movie[:rated] = data[:Rated]
      movie[:year] = data[:Year]
      movie[:genre] = data[:Genre]
      movie[:director] = data[:Director]
    end
  end

    def rotten_rating(data)
    if data[:Ratings]
      rotten = data[:Ratings].find do |hash|
        hash[:Source] == "Rotten Tomatoes"
      end
    end
    if !rotten
      rotten = {}
      rotten[:Value] = 'n/a'
    end
    rotten[:Value] 
  end

  def create_movie_list(data_list)
    data_list.map {|data| new_movie_params(data)}
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
      cast: add_cast(data),
      directors: add_director(data),
    }
  end

  def add_cast(data)
    return data[:cast].split(', ') if data[:cast]
    nil
  end

  def add_director(data)
    return data[:director].split(', ') if data[:director]
    nil
  end


end