class StreamingController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @streaming_data = StreamingResults.new.streaming_data(@movie.imdb_id)
  end

end