class AddStatusToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :status, :string
  end

  def self.down
    remove_column :movies, :status
  end
end
