class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  has_many :song_genres
  has_many :genres, through: :song_genres

  before_save :generate_slug

  # enum rating: {default: 0, 1, 2, 3, 4, 5}

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
