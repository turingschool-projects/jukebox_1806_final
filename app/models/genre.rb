class Genre < ApplicationRecord
  validates :name, presence: true
  has_many :song_genres
  has_many :songs, through: :song_genres

  def average_rating
    songs.average(:rating).to_f.round(2)
  end
end
