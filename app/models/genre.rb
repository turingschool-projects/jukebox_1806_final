class Genre < ApplicationRecord
  has_many :song_genres
  has_many :songs, through: :song_genres
  validates_presence_of :name

  def average_song_rating
    songs.average(:rating)
  end
end
