class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :song_genres
  has_many :songs, through: :song_genres

  def avg_song_rating
    songs.average(:rating).round(2)
  end
end
