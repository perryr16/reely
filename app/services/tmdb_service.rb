class TmdbService 

  def get_actor_id(actor)
    response = conn.get('/3/search/person') do |res|
      res.params[:query] = actor 
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:id]
  end

  def get_credits_by_actor_id(id)
    response = conn.get("/3/person/#{id}/movie_credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_best_by_actor_id(id, page=1)
    response = conn.get("/3/discover/movie") do |res|
      res.params[:sort_by] = 'vote_average.desc'
      res.params['vote_count.gte'] = 100
      res.params[:with_cast] = id
      res.params[:page] = page
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_worst_by_actor_id(id, page=1)
    response = conn.get("/3/discover/movie") do |res|
      res.params[:sort_by] = 'vote_average.asc'
      res.params['vote_count.gte'] = 100
      res.params[:with_cast] = id
      res.params[:page] = page
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_best_by_actor(actor, page=1)
    id = get_actor_id(actor)
    get_best_by_actor_id(id, page)
  end

  def get_worst_by_actor(actor, page=1)
    id = get_actor_id(actor)
    get_worst_by_actor_id(id, page)
  end

  def get_trailer(id)
    response = conn.get("/3/movie/#{id}") do |res|
      res.params[:append_to_response] = 'videos'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

   
  def conn 
    Faraday.new('http://api.themoviedb.org') do |res|
      res.params[:api_key] = ENV['TMDB_KEY']
    end
  end

end

# https://api.themoviedb.org/3/person/287?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8

# https://api.themoviedb.org/3/search/person?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8&query=brad%20pitt