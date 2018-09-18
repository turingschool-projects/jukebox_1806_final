class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates_presence_of :rating
  validates :rating, numericality: {less_than_or_equal_to: 5}
  validates :rating, numericality: {greater_than_or_equal_to: 1}

  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
