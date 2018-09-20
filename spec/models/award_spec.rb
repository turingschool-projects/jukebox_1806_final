require 'rails_helper'

describe Award, type: :model do
  describe 'associations' do
    it {should have_many(:song_awards)}
    it {should have_many(:songs).through(:song_awards)}
  end
end
