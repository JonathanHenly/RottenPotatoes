class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end
  
  def show
    # retrieve movie ID from URI route
    id = params[:id]
    # look up movie by unique ID
    @movie = Movie.find(id)
    # will render app/views/movies/show.html.haml by default
  end
  
  # Using "Movie.create(params[:movie])" would raise an
  # ActiveModel::ForbiddenAttributes exception because it'd
  # be using mass assignment without an explicit permit step.
  # This is the recommended form:
  def create
    Movie.create(movie_params)
  end
  
  
  def update
    
  end
  
  
  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end