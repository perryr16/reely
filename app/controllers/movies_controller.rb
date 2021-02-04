class MoviesController < ApplicationController

  def show
    @movie = Movie.get_movie_and_tweets(params[:id])
    @streaming_data = StreamingResults.new.streaming_data(@movie.imdb_id)
    
  end

end