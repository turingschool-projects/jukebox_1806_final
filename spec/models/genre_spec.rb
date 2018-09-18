require 'rails_helper'

describe GenreSong, type: :model do
  describe 'relationships' do
    it {should belong_to(:genre)}
    it {should belong_to(:song)}
  end
  describe 'methods' do
    it 'should calculate the average rating for the songs in a genre' do
      genre1 = Genre.create(name: 'Pop')
      artist = Artist.create(name: 'The One Artist')
      song1 = genre1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, artist_id: artist.id, rating:4)
      song2 = genre1.songs.create!(title: 'Hey Mama', length: 300, play_count: 5000000, artist_id: artist.id, rating:2)

      expect(genre1.average_rating).to eq(3)
    end
  end
end
