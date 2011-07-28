class Movie < ActiveRecord::Base
  validates_presence_of :name,:year
  validates_numericality_of :year, :only_integer => true, :greater_than => 1930, :less_than_or_equal_to => Time.now.year
  validates_uniqueness_of :name, :scope => :year
  after_initialize :defaults

  def mark_as_rented
    self.status =  "rented"
    self.save
  end
  
  private
  def defaults
    self.status ||= "available"
  end
end
