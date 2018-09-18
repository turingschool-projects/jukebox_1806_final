require 'rails_helper'

describe Genre, type: :model do
	describe 'relationships' do
		it { should have_many :song_genres }
		it { should have_many(:songs).through(:song_genres) }
	end
  describe 'Instance Methods' do
    it '#avg_rating' do
      genre  = Genre.create(name: 'Alternative Rock')
      artist = Artist.create(name: 'Smashing Pumpkins')
      song1 = artist.songs.create(title: '1979', length: 100, play_count: 5, rating: 5)
      song2 = artist.songs.create(title: 'Disarm', length: 126, play_count: 3, rating: 2)

      genre.songs << [song1, song2]

      expected_result = (song1.rating + song2.rating).to_f / genre.songs.count

      expect(genre.avg_rating).to eq(expected_result)
    end
  end
end