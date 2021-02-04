class TwitterService 

  def get_tweets(query)
    response = conn.get('/2/tweets/search/recent') do |req|
      req.params["query"] = query
      req.params[:expansions] = 'author_id'
      req.params['user.fields'] = 'name,username,profile_image_url'
    end
    x = JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  def conn 
    Faraday.new('https://api.twitter.com') do |req|
      req.authorization :Bearer, ENV['TWITTER_BEARER']
    end
  end

end
