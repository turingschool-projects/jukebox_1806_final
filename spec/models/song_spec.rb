require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it {should have_many :genre_songs}
    it {should have_many :genres}
  end
end
