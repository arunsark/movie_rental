class Customer < ActiveRecord::Base

  has_many :rentals
  
end
