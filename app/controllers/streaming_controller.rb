class StreamingController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
  end
end