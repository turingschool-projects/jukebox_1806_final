class Genre < ApplicationRecord
	has_many :song_genres
	has_many :songs, through: :song_genres

  def avg_rating
    songs.average(:rating).to_f
  end
end