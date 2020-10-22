class DblessSearchController < ApplicationController

  def index
    @data = session[:search_data]
    session[:search_data][:page] += 1 if params[:page] == "next"
    session[:search_data][:page] -= 1 if params[:page] == "back"
    @page = session[:page]
  end

  def create 
    session[:search_data] = 
      {search: params[:search], 
      type: params[:search_type],
      page: 0
      }
    create_movie_list
    redirect_to dbless_search_index_path
  end

  private 
  
  def create_movie_list
    results = DblessResults.new
    if params[:person_type] == "Actor's"
      session[:search_data][:movie_list] = results.best_acted(params[:search]) if params[:search_type] == "Best"
      session[:search_data][:movie_list] = results.worst_acted(params[:search]) if params[:search_type] == "Worst"
    elsif params[:person_type] == "Director's"
      session[:search_data][:movie_list] = results.best_directed(params[:search]) if params[:search_type] == "Best"
      session[:search_data][:movie_list] = results.worst_directed(params[:search]) if params[:search_type] == "Worst"
    end
  end
  
end