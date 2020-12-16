class TmdbService 

  def get_actor_id(actor)
    response = conn.get('/3/search/person') do |req|
      req.params[:query] = actor 
    end
    json = JSON.parse(response.body, symbolize_names: true)
    return "n/a" if json[:results].empty?
    json[:results][0][:id]
  end

  def get_trailer(id)
    response = conn.get("/3/movie/#{id}") do |req|
      req.params[:append_to_response] = 'videos'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_by_director_id(id)
    response = conn.get("/3/person/#{id}/combined_credits")
    JSON.parse(response.body, symbolize_names:true)
  end

  def get_search_title(title)
    response = conn.get('/3/search/movie') do |req|
      req.params[:query] = title 
    end
    json = JSON.parse(response.body, symbolize_names: true)
    return "n/a" if json[:results].empty?
    json[:results]
  end

  def get_all_by_actor_id(id)
    response = conn.get("/3/person/#{id}/movie_credits")
    JSON.parse(response.body, symbolize_names:true)
  end

  def get_all_by_director(director)
    id = get_actor_id(director)
    directed = get_all_by_director_id(id)[:crew].find_all {|movie| movie[:job] == "Director"}
  end
  
  def get_all_by_actor(actor)
    id = get_actor_id(actor)
    directed = get_all_by_actor_id(id)[:cast]
  end



  def conn 
    Faraday.new('http://api.themoviedb.org') do |res|
      res.params[:api_key] = ENV['TMDB_KEY']
    end
  end

end

# https://api.themoviedb.org/3/person/287?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8

# https://api.themoviedb.org/3/search/person?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8&query=brad%20pitt