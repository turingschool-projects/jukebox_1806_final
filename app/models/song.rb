class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :genre_songs
  has_many :genres, through: :genre_songs

  before_save :generate_slug

  validates_presence_of :title, :length, :rating

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
