require "rails_helper"

describe GenreSong, type: :model do
  describe 'relationships' do
    it {should belong_to(:song)}
    it {should belong_to(:genre)}
  end
end
