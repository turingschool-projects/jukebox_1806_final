require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
    it {should have_many :genre_songs}
    it {should have_many(:genres).through(:genre_songs)}
  end
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :length}
    it {should validate_presence_of :rating}
  end
end
