class TwitterService 

  def get_tweets(query)
    response = conn.get('/2/tweets/search/recent?expansions=author_id&user.fields=name,username,profile_image_url') do |req|
      req.params["query"] = query
    end
    x = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
  
  private
  def conn 
    Faraday.new('https://api.twitter.com') do |req|
      req.authorization :Bearer, ENV['TWITTER_BEARER']
    end
  end

end
