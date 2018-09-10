require 'rails_helper'

describe Cart do

  subject {Cart.new({1 => 2, 2 => 3})}

  describe '#total_count' do
    it 'can clculate the total number of items it holds' do

      expect(subject.total_count).to eq(5)
    end
  end

  describe '#add_song' do
    it 'adds a song to its contents' do
      subject.add_song(1)
      subject.add_song(2)

      expect(subject.contents).to eq ({1 => 3, 2 => 4})
    end
  end
end
