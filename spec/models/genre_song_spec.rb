require 'rails_helper'

describe GenreSong, type: :model do
  describe 'relations' do
    it {should belong_to :genre}
    it {should belong_to :song}
  end
end
