require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {should have_many(:song_genres)}
    it {should have_many(:songs).through(:song_genres)}
  end
end
