
require 'spec_helper'

describe Movie do
  before do
    @attr = {:name=>"Cars",:year=>2011,:language=>"English",:status=>"available"}
  end

  it "should have a status" do
    movie = Movie.new(@attr)
    movie.should be_valid
  end

  it "should have a default status of available" do
    @attr[:status] = nil
    movie = Movie.new(@attr)
    movie.status.should eq("available")
  end
end
