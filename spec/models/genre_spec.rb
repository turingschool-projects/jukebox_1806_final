require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :genre_songs}
    it {should have_many :songs}
  end

  describe 'instance methods' do
    before (:each) do
      @genre_1 = Genre.create(name: "Rock")
      @genre_2 = Genre.create(name: "Pop")
      @artist_1 = Artist.create(id: 1, name: "Singer Guy")

      @song_1 = @genre_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4, artist_id: 1)
      @song_2 = @genre_1.songs.create(title: 'Bye Bye Bye', length: 300, play_count: 5000000, rating: 1, artist_id: 1)
      @song_3 = @genre_1.songs.create(title: 'Purple Rain', length: 300, play_count: 5000000, rating: 5, artist_id: 1)
    end
    it 'should average ratings' do
      expect(@genre_1.average_rating).to eq(3.33)
    end
  end
end
