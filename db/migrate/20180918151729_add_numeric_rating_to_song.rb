class AddNumericRatingToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :number_rating, :integer, inclusion: 0..5
  end
end
