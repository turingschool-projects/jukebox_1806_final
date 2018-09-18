class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :song_genres
  has_many :genres, through: :song_genres
  before_save :generate_slug

  def similar_songs
    Song.where(rating: rating).where.not(id: id)
  end

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
