class MovieSearchController < ApplicationController 

  def index 
    @actor = session[:search]
    @type = session[:type]
    @movies = Movie.find(session[:search_ids]) if session[:search_ids]
    session[:page] += 1 if params[:page] == "next"
    session[:page] -= 1 if params[:page] == "back"
    @page = session[:page]
  end

  def create 
    session[:search] = params[:search]
    session[:type] = params[:search_type]
    session[:page] = 0
    create_game_objects
    redirect_to movie_search_index_path
  end

  private 

  def create_game_objects
    results = ActorResults.new
    if params[:person_type] == "Actor's"
      movies = results.best_acted(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_acted(params[:search]) if params[:search_type] == "Worst"
    elsif params[:person_type] == "Director's"
      movies = results.best_directed(params[:search]) if params[:search_type] == "Best"
      movies = results.worst_directed(params[:search]) if params[:search_type] == "Worst"
    end
    # binding.pry
    search_titles = movies.map {|movie| movie[:title]} if movies
    movie_ids(search_titles) if movies
  end

  def movie_ids(search_titles)
    session[:search_ids] = []
    search_titles.each do |title|
      movie = Movie.find_by(title: title)
      session[:search_ids] << movie.id
    end
  end
  
end