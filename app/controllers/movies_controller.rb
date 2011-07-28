class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "Movie added successfully!"
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
      flash[:notice] = "Movie deleted successfully!"
      redirect_to movies_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Movie upated successfully!"
      redirect_to movies_path
    else
      render 'movies/edit'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
