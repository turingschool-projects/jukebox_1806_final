class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :song_genres
  has_many :genres, through: :song_genres
  validates_numericality_of :rating, :only_integer => true, :allow_nil => true,
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 5


  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
