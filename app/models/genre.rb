class Genre < ApplicationRecord
	has_many :song_genres
	has_many :songs, through: :song_genres

  def avg_rating
    songs.average(:rating).to_f
  end

  def highest_rated_song
    songs.find_by_rating(highest_rating)
  end

  def lowest_rated_song
    songs.find_by_rating(lowest_rating)
  end

  private

  def highest_rating
    songs.maximum(:rating)
  end

  def lowest_rating
    songs.minimum(:rating)
  end
end