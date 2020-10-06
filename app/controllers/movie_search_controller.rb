class MovieSearchController < ApplicationController 

  def create 
    session[:search] = params[:search]
    create_game_objects
    search_redirect
  end

  private 

  def create_game_objects
    results = MovieResults.new
    results
  end

  def search_redirect
    redirect_to best_movie_search_index_path if params[:search_type] == "best"
    redirect_to worst_movie_search_index_path if params[:search_type] == "worst"
  end
  
end