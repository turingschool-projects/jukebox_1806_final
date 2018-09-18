require 'rails_helper'

describe Genre, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :song_genres}
    it {should have_many(:songs).through(:song_genres)}
  end

  describe "instance methods" do
    it "#average_rating" do
      genre_1 = Genre.create!(name: "Funk")
      genre_2 = Genre.create!(name: "Soul")
      artist_1 = Artist.create(name: "Rick James")
      song_1 = genre_1.songs.create(artist_id: artist_1.id, title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
      song_2 = genre_1.songs.create(artist_id: artist_1.id, title: 'Mary Jane', length: 300, play_count: 5000000, rating: 3)
      song_3 = genre_2.songs.create(artist_id: artist_1.id, title: "Cotton-Eyed Joe", length: 400, play_count: 10000, rating: 4) 

      expect(genre_1.average_rating).to eq(2)
    end
  end
end
