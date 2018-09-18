require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
  end
  describe 'validation' do
    it {should validate_inclusion_of(:rating).in?([1,2,3,4,5])}
  end
end
