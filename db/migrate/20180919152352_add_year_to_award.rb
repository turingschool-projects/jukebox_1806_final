class AddYearToAward < ActiveRecord::Migration[5.1]
  def change
    add_column :awards, :year, :integer
  end
end
