require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
  end

  describe 'associations' do
    it { should have_many :song_genres}
    it { should have_many(:genres).through(:song_genres) }
  end
end
