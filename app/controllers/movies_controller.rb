class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new # Needed to instantiate the form_with
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to movie_path(@movie)
  end

  def edit
  end

  def update
    @task.update(movie_params) # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :details, :completed)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
