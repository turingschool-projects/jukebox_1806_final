require 'rails_helper'

describe Genre, type: :model do
	describe 'relationships' do
		it { should have_many :song_genres }
		it { should have_many(:songs).through(:song_genres) }
	end
  describe 'Instance Methods' do
    before(:each) do
      @genre  = Genre.create(name: 'Alternative Rock')
      @artist = Artist.create(name: 'Smashing Pumpkins')
      @song1 = @artist.songs.create(title: '1979', length: 100, play_count: 5, rating: 5)
      @song2 = @artist.songs.create(title: 'Disarm', length: 126, play_count: 3, rating: 2)

      @genre.songs << [@song1, @song2]
    end
    it '#avg_rating' do
      expected_result = (@song1.rating + @song2.rating).to_f / @genre.songs.count

      expect(@genre.avg_rating).to eq(expected_result)
    end
    it '#highest_rated_song' do
      expect(@genre.highest_rated_song).to eq(@song1)
      expect(@genre.highest_rated_song.title).to eq(@song1.title)
      expect(@genre.highest_rated_song.rating).to eq(@song1.rating)
    end
    it '#lowest_rated_song' do
      expect(@genre.lowest_rated_song).to eq(@song2)
      expect(@genre.lowest_rated_song.title).to eq(@song2.title)
      expect(@genre.lowest_rated_song.rating).to eq(@song2.rating)
    end
  end
end