class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(params[:rental])
    if @rental.save
      flash[:notice] = "#{@rental.movie.name} has been rented to #{@rental.customer.name}!"
      redirect_to movies_path
    else
      flash[:notice] = "Sorry! That movie could not be rented out"
      render 'rentals/new'
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
