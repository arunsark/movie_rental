require 'spec_helper'

describe RentalsController do

  describe "CREATE" do
    before do
      @movie = Movie.new(:name=>"Cars",:year=>2011,:language=>"English",:genre=>"animation")
      @movie.save
      @customer = Customer.new(:name=>"Tom",:address=>"Hyderabad")
      @customer.save
      @attr = {:movie_id => @movie.id, :customer_id => @customer.id}
    end

    context "success" do
      it "should create rental" do
        lambda do
          post :create, :rental => @attr
        end.should change(Rental,:count).by(1)
      end

      it "should flash success message" do
        post :create, :rental => @attr
        flash[:notice].should == "#{@movie.name} has been rented to #{@customer.name}!"
      end
    end

    context "failure" do
      before do
        @movie.update_attributes(status:"rented")
      end

      it "should not create rental" do
        lambda do
          post :create, :rental => @attr
        end.should_not change(Rental,:count)
      end

      it "should flash error message" do
        post :create, :rental => @attr
        flash[:notice].should == "Sorry! That movie could not be rented out"
      end
    end
  end
end

