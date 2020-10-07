class MovieSearchController < ApplicationController 

  def create 
    session[:search] = params[:search]
    create_game_objects
    search_redirect
  end

  private 

  def create_game_objects
    results = MovieResults.new
    movies = results.best_by(params[:search])
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

  def search_redirect
    redirect_to best_movie_search_index_path if params[:search_type] == "best"
    redirect_to worst_movie_search_index_path if params[:search_type] == "worst"
  end
  
end