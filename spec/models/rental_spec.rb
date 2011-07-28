require 'spec_helper'

describe Rental do

  describe "Make Rental to a Customer" do
    before do
      @movie = Movie.new(:name=>"Cars",:year=>2011,:language=>"English",:genre=>"animation")
      @customer = Customer.new(:name=>"Tom",:address=>"Hyderabad")
      @movie.save
      @customer.save
      @attr = {:movie_id => @movie.id, :customer_id => @customer.id}
      @rental = Rental.new(@attr)
    end

    context "movie available" do
      it "should create rental" do
        @rental.save.should be_true
      end
      it "should update movie status to rented" do
        @rental.save
        movie = Movie.find(@movie.id)
        movie.status.should eq("rented")
      end
    end

    context "movie rented" do
      before do
        @movie.update_attributes(status:"rented")
      end
      it "should not create the rental" do
        @rental.save.should_not be_true
      end
    end
  end
end
