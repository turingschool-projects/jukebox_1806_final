require 'rails_helper'

RSpec.describe Genre, type: :model do
  it {should validate_presence_of(:name)}
  it {should have_and_belong_to_many(:songs)}
  describe 'methods' do
    it 'average_song_rating' do
      genre = Genre.create(name: "Dance")
      artist = Artist.create(name: "Bob")
      genre.songs.create!(title: "Ajio",
                          artist: artist,
                          length: 100,
                          play_count: 50,
                          rating: 1)

      genre.songs.create!(title: "Basdf",
                          length: 100,
                          artist: artist,
                          play_count: 50,
                          rating: 3)
     expect(genre.average_song_rating).to eq(2)
    end
  end
end
