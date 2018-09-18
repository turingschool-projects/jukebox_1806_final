require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {should have_many :genre_songs}
    it {should have_many :songs}
  end
end
