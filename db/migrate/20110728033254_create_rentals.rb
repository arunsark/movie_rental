class CreateRentals < ActiveRecord::Migration
  def self.up
    create_table :rentals do |t|
      t.date :date
      t.integer :customer_id
      t.integer :movie_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rentals
  end
end
