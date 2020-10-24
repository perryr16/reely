class DblessSearchController < ApplicationController

  def index
    @data = {movies: create_movie_list, search: params[:search], type: params[:search_type]}
  end

  # def create 
  #   binding.pry
  #   session[:search_data] = 
  #     {search: params[:search], 
  #     type: params[:search_type],
  #     page: 0
  #     }
  #   # create_movie_list
  #   redirect_to dbless_search_index_path
  # end

  private 
  
  def create_movie_list
    results = DblessResults.new
    if params[:person_type] == "Actor's"
      movies = results.best_acted(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_acted(params[:search]) if params[:search_type] == "Worst"
    elsif params[:person_type] == "Director's"
      movies = results.best_directed(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_directed(params[:search]) if params[:search_type] == "Worst"
    end
    movies
  end
  
end