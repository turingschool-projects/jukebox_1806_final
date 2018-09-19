require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it {should have_many(:award_songs)}
    it {should have_many(:awards).through(:award_songs)}
  end
end
