class WorstMovieSearchController < ApplicationController 

  def index 
    @actor = session[:search]
    # @movies = 
  end

  def create 
    session[:search] = params[:search]
    create_game_objects
    redirect_to "/movie_search"
  end

  private 

  def create_game_objects
    results = MovieResults.new
    results.create_
  end
  
end