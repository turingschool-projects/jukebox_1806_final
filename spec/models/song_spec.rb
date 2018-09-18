require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it { should have_many :song_genres }
    it { should have_many :genres }
  end

  describe 'class methods' do
    it ".average_rating" do
      artist = Artist.create(name: "Rick James")
      song_1 = artist.songs.create!(title: 'Funeral Thirst', length: 300, play_count: 5000000, artist_id: artist.id, rating: 3)
      song_2 = artist.songs.create(title: 'Mordecai', length: 200, play_count: 10000, artist_id: artist.id, rating: 5)

      expect(Song.average_rating).to eq(4)
    end
  end
end
