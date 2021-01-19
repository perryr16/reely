class CommentsController < ApplicationController
  def create 
  end

  def new 
    @movie = Movie.find(params[:movie_id])
  end
end