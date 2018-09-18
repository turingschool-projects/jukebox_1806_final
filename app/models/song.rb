class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates_presence_of :rating

  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
