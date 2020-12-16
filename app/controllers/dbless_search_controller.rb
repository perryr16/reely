class DblessSearchController < ApplicationController

  def index
    @data = {movies: create_movie_list, search: params[:search], type: params[:search_type]}
  end

  private 
  
  def create_movie_list
    results = DblessResults.new
    case params[:person_type]
    when "Actor's"
      movies = results.best_acted(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_acted(params[:search]) if params[:search_type] == "Worst"
    when "Director's"
      movies = results.best_directed(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_directed(params[:search]) if params[:search_type] == "Worst"
    when "Title"
      movies = results.by_title(params[:search])
    end
    movies
  end
  
end