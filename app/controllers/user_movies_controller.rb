class UserMoviesController < ApplicationController
  def create 
    movie = create_or_find_movie
    if !current_user
      flash[:notice] = "you must sign in to save movies"
      redirect_back(fallback_location: '/profile')
    elsif UserMovie.user_movie_exists?(current_user.id, movie.id)
      flash[:notice] = "you have already saved this movie"
      redirect_back(fallback_location: '/profile')
    else 
      current_user.movies << movie 
      flash[:notice] = "you have saved #{movie.title}"
      redirect_to '/profile'
    end
  end

  def destroy 
    movie = Movie.find(params[:id])
    user_movie = UserMovie.find_by(user_id: current_user.id, movie_id: movie.id)
    UserMovie.destroy(user_movie.id)
    redirect_back(fallback_location: '/profile')
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