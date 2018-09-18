class Genre < ApplicationRecord
  validates :name, presence: true
  has_many :song_genres
  has_many :songs, through: :song_genres
end
