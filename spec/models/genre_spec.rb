require 'rails_helper'

RSpec.describe Genre, type: :model do
  it {should have_many(:genre_songs)}
  it {should have_many(:songs).through(:genre_songs)}
end

describe 'instance methods' do
  describe "average ratings for songs in genre" do
    it 'should calculate average rating for songs in that genre' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
      song_3 = artist_1.songs.create(title: 'Bad Mamajama', length: 100, play_count: 10000000, rating: 5)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 2)
      genre_1 = Genre.create(title: "Funk", songs: [song_1, song_3])
      genre_2 = Genre.create(title: "Rap", songs: [song_2])
      expect(genre_1.average_rating_of_songs).to eq(3)
      expect(genre_2.average_rating_of_songs).to eq(2)
    end
  end
end
