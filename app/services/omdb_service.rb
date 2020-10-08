class OmdbService 
  
  def get_movie_data(imdb_id)
    response = Faraday.get('http://www.omdbapi.com/') do |res|
      res.params[:apikey] = ENV['OMDB_KEY']
      res.params[:i] = imdb_id
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
end