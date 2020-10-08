class MovieSearchController < ApplicationController 

  def index 
    @actor = session[:search]
    @type = session[:type]
    @movies = Movie.find(session[:search_ids])
  end

  def create 
    session[:search] = params[:search]
    session[:type] = params[:search_type]
    create_game_objects
    redirect_to movie_search_index_path
  end

  private 

  def create_game_objects
    results = MovieResults.new
    if params[:person_type] == "Actor's"
      movies = results.best_by(params[:search], params[:p]) if params[:search_type] == "Best"
      movies = results.worst_by(params[:search], params[:p]) if params[:search_type] == "Worst"
    end
    search_titles = movies.map {|movie| movie[:title]}
    movie_ids(search_titles)
  end

  def movie_ids(search_titles)
    session[:search_ids] = []
    search_titles.each do |title|
      movie = Movie.find_by(title: title)
      session[:search_ids] << movie.id
    end
  end

  # def search_redirect
  #   redirect_to best_movie_search_index_path if params[:search_type] == "best"
  #   redirect_to worst_movie_search_index_path if params[:search_type] == "worst"
  # end
  
end