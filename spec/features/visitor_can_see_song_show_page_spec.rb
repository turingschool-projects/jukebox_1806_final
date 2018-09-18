require 'rails_helper'

describe 'as a visitor' do
  describe 'viewing songs show page' do
    before (:each) do
      @artist_1 = Artist.create(name: "artist name")
      @song_1 = @artist_1.songs.create!(title: "songsongsong", length: 234, play_count: 345, rating: 3)
    end
    it 'should display song rating on page' do
      visit song_path(@song_1.slug)

      expect(page).to have_content("Rating: #{@song_1.rating}")
    end
  end
end
