require 'rails_helper'

describe Genre, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  
  describe 'Relationships' do 
    it { should have_many :song_genres }
    it { should have_many :songs }
  end
  
  describe 'Class Methods' do 
    it 'should calculate average song rating for a genre' do
      artist = Artist.create(name: "Prince")
      genre = Genre.create(name: 'Jazz')
      song_1 = genre.songs.create(title: "Purple Rain", length: 209, play_count: 3445, artist_id: artist.id, rating: 4)
      song_2 = genre.songs.create(title: "Purple Haze", length: 209, play_count: 3445, artist_id: artist.id, rating: 2)
      
      expected = 3
      actual = genre.average_rating
      
      expect(actual).to eq(expected)
    end
  end
end