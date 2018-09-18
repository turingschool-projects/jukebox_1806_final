class Genre < ApplicationRecord
  has_and_belongs_to_many :songs
  validates_presence_of :name

  def average_song_rating
    songs.average(:rating)
  end
end
