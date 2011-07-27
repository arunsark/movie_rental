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
    @movies = Movie.all
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    end      
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      redirect_to movies_path
    else
      render 'movies/edit'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
