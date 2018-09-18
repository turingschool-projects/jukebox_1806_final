require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {should have_many(:songs).through(:genre_songs)}
  end
end
