class MoviesController < ApplicationController

  def show
    @movie = Movie.get_movie_and_tweets(params[:id])
    @streaming_data = StreamingResults.new.streaming_data(@movie.imdb_id)
  end

  def create 
    movie = create_or_find_movie
    redirect_to movie_path(movie)
  end

  private 

  def create_or_find_movie 
    if !Movie.find_by(title: params[:title])
      movie = Movie.create(movie_params)
      movie.add_crew(params[:cast], params[:directors])
      movie
    else 
      movie = Movie.find_by(title: params[:title])
    end
  end

  def movie_params
    {
    title: params[:title],
    year: params[:year],
    rating: params[:rating],
    imdb: params[:imdb],
    rotten: params[:rotten],
    metacritic: params[:metacritic],
    trailer: params[:trailer],
    poster: params[:poster],
    description: params[:description],
    imdb_id: params[:imdb_id],
    rated: params[:rated],
    genre: params[:genre],
    }
  end
  
  

end