class BestMovieSearchController < ApplicationController 

  def index 
    @actor = session[:search]
    # @movies = 
  end

  def create 
    session[:search] = params[:search]
    create_game_objects
    redirect_to "/best_movie_search"
  end

  private 

  def create_game_objects
    results = MovieResults.new
    results
  end
  
end