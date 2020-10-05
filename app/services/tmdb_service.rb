class TmdbService 

  def get_actor_id(actor)
    response = conn.get('/3/search/person') do |res|
      res.params[:query] = actor 
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:id]
  end

  def get_movies_by_actor_id(id)
    res = conn.get('/3/person/287')
    binding.pry
  end
   
  def conn 
    Faraday.new('http://api.themoviedb.org') do |res|
      res.params[:api_key] = ENV['TMDB_KEY']
    end
  end

end

# https://api.themoviedb.org/3/person/287?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8

# https://api.themoviedb.org/3/search/person?api_key=72af3a9eea0e5761f3a4c7d31d7b2ac8&query=brad%20pitt