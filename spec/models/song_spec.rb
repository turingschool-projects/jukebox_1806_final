require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it { should have_many(:song_genres) }
    it { should have_many(:genres).through(:song_genres) }
  end
  describe 'validations' do
  	it do
  		should validate_numericality_of(:rating).
  			only_integer.
  			is_less_than_or_equal_to(5).
  			is_greater_than_or_equal_to(0)
  	end
  end
end
