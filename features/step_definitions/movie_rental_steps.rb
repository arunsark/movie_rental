Given /^there is a customer named "([^"]*)"$/ do |name|
  customer = Customer.new(:name => name)
  customer.save
end

Given /^there is a movie named "([^"]*)" available in the store$/ do |name|
  movie = Movie.new(:name=>name,:year=>2011,:language=>"English", :genre=>"Action")
  movie.status = "available"
  movie.save
end

When /^I rent out the movie "([^"]*)" to "([^"]*)"$/ do |movie, customer|
  select(movie,:from=>'Movie')
  select(customer,:from=>'Customer')
  click_button 'Create Rental'
end

Then /^the movie "([^"]*)" should be rented out$/ do |movie|
  movie = Movie.find_by_name(movie)
  movie.status.should eq ("rented")
end

Then /^I should see the message "([^"]*)"$/ do |msg|
  page.should have_content(msg)
end

Given /^there is a movie named "([^"]*)" already rented out$/ do |name|
  movie = Movie.new(:name=>name,:year=>2011,:language=>"English", :genre=>"Action")
  movie.save
  customer = Customer.new(:name=>"foo")
  customer.save
  rental = Rental.new(:movie_id=>movie.id,:customer_id=>customer.id)
  rental.save.should be_true
end

Then /^the movie "([^"]*)" should not be rented out$/ do |movie|
  Rental.count.should == 1  
end
