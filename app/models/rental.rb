class Rental < ActiveRecord::Base

  belongs_to :movie
  belongs_to :customer
  before_save :mark_as_rented

  private
  def mark_as_rented
    if self.movie.status == "available"
      self.movie.mark_as_rented
    else
      false
    end
  end

end
