class AddRatingsToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :rating, :string
  end
end
