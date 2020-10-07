class WorstMovieSearchController < ApplicationController 

  def index 
    @actor = session[:search]
    @movies = Movie.find(session[:search_ids])
  end
  
end