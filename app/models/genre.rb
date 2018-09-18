class Genre < ApplicationRecord
  has_many :genre_songs
  has_many :songs, through: :genre_songs

  def average_rating_of_songs
    songs.average(:rating)
  end
end
