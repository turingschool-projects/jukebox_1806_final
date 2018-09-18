class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :song_genres
  has_many :genres, through: :song_genres
  validates_numericality_of :rating, greater_than: 0, less_than: 6
  validates_presence_of :rating

  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
