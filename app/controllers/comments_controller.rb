class CommentsController < ApplicationController
  def create 
    Comment.create(
      comment: params[:comment],
      image_url: current_user.photo,
      user_id: current_user.id,
      movie_id: params[:format]
    )
    movie = Movie.find(params[:format])
    flash[:notice] = "You have commented on #{movie.title}"
    redirect_back(fallback_location: '/profile')
  end

  def new 
    @movie = Movie.find(params[:movie_id])
  end
end