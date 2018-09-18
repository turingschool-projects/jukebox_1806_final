class Genre < ApplicationRecord
  has_many :genre_songs
  has_many :songs , through: :genre_songs
  validates_presence_of :name

end
