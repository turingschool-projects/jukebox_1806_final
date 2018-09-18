require 'rails_helper'

describe SongGenre, type: :model do
  
  describe 'Relationships' do 
    it { should belong_to :song}
    it { should belong_to :genre}
  end
end