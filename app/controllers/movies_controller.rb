class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'movies/new'
    end
  end

  def index
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
