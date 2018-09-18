require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting show page' do
    before(:each) do
      @genre_1 = Genre.create(name: "Rock")
      @genre_2 = Genre.create(name: "Pop")
      @artist_1 = Artist.create(id: 1, name: "Singer Guy")

      @song_1 = @genre_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4, artist_id: 1)
      @song_2 = @genre_1.songs.create(title: 'Bye Bye Bye', length: 300, play_count: 5000000, rating: 1, artist_id: 1)
      @song_3 = @genre_1.songs.create(title: 'Purple Rain', length: 300, play_count: 5000000, rating: 5, artist_id: 1)
      @song_4 = @genre_2.songs.create(title: 'Other Song', length: 300, play_count: 5000000, rating: 2, artist_id: 1)
    end
    it "should list all songs with that genre" do
      visit genre_path(@genre_1)

      expect(page).to have_content("Rock Songs")
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content(@song_2.title)
      expect(page).to have_content(@song_3.title)
      expect(page).to_not have_content(@song_4.title)
    end
  end
end
