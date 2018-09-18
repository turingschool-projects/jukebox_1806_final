class AddRatingToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :rating, :integer, default: 1
  end
end
