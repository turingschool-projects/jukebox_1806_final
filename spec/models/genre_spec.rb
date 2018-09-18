require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it {should have_many(:songs).through(:song_genres)}
    it {should have_many(:song_genres)}
  end
  describe 'methods' do
    it '#average_song_rating' do
      genre = Genre.create(name: 'Death Metal')
      artist = Artist.create(name: "Rick James")
      song_1 = artist.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4)
      song_2 = artist.songs.create(title: 'Ice Baby', length: 300, play_count: 5000000, rating: 3)
      song_3 = artist.songs.create(title: 'Mariposa', length: 300, play_count: 5000000, rating: 2)
      song_4 = artist.songs.create(title: 'Wildflower', length: 300, play_count: 5000000, rating: 2)

      genre.songs << song_1
      genre.songs << song_2
      genre.songs << song_3

      expect(genre.average_song_rating).to eq(3)
    end
  end
end
