class Movie < ActiveRecord::Base
  validates_presence_of :name,:year
  validates_numericality_of :year, :only_integer => true, :greater_than => 1930, :less_than_or_equal_to => Time.now.year
  validates_uniqueness_of :name, :scope => :year
end
