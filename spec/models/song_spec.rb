require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it { should have_many(:song_genres) }
    it { should have_many(:genres), through: :song_genres }
  end

  describe 'instance methods' do
    context '#similar_songs' do
      it 'should return array of all songs with same rating' do
        @artist_1 = Artist.create(name: "Rick James")
        @artist_2 = Artist.create(name: "Artist 2")
        @song = @artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
        @song_2 = @artist_1.songs.create(title: 'Song 2', length: 113, play_count: 24346, rating: 2)
        @song_3 = @artist_2.songs.create(title: 'Song 3', length: 400, play_count: 50346000, rating: 5)
        @song_4 = @artist_2.songs.create(title: 'Song 4', length: 231, play_count: 3463, rating: 2)
        @song_5 = @artist_1.songs.create(title: 'Song 5', length: 412, play_count: 26833, rating: 2)

        expect(@song.similar_songs).to eq([@song_2, @song_4, @song_5])
      end
    end
  end
end
