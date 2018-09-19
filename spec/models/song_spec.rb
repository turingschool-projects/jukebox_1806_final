require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it {should have_many :song_awards}
    it {should have_many(:awards).through(:song_awards)}
  end
end
