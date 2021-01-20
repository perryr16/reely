class GoWatchService 

  def get_streaming_data(imdb_id)
    response = conn.get('/title/imdb_id') do |res|
      res.params["id"] = imdb_id 
      res.params["type"] = "movie"
      res.params["country"] = "us"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new('https://gowatch.p.rapidapi.com/lookup') do |res|
      res.headers["x-rapidapi-key"] = ENV['GOWATCH_KEY']
      res.headers["x-rapidapi-host"] = "gowatch.p.rapidapi.com"
      res.headers["Content-Type"] = "application/x-www-form-urlencoded"
    end
  end
  
end