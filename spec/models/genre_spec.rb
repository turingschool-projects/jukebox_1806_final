require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'Relationships' do
    it {should have_many(:song_genres)}
    it {should have_many(:songs).through(:song_genres)}
  end
  describe 'Instance Methods' do
    it 'calculates #average_rating of songs' do
      genre1 = Genre.create(name: "Hip Hop")
      genre2 = Genre.create(name: "Classical")
      artist = Artist.create(name: "Artist")
      song1 = genre1.songs.create(title: 'Song 1', length: 130, play_count: 10, artist_id: artist.id, rating: 3)
      song2 = genre1.songs.create(title: 'Song 2', length: 330, play_count: 30, artist_id: artist.id, rating: 4)
      song3 = genre2.songs.create(title: 'Song 3', length: 100, play_count: 5, artist_id: artist.id, rating: 5)

      expect(genre1.average_rating).to eq(3.5)
    end
  end
end
