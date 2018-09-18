require 'rails_helper'

describe 'as a visitor' do
  describe 'viewing songs show page' do
    before (:each) do
      @artist_1 = Artist.create(name: "artist name")
      @song_1 = @artist_1.songs.create!(title: "songsongsong", length: 234, play_count: 345, rating: 3)
      @song_2 = @artist_1.songs.create!(title: "other song", length: 234, play_count: 345, rating: 5)
      @genre_1 = @song_1.genres.create(name: "Rock")
      @genre_2 = @song_1.genres.create(name: "Pop")
      @genre_3 = @song_1.genres.create(name: "Hip Hop")
      @genre_4 = @song_2.genres.create(name: "Country")
    end
    it 'should display song rating on page' do
      visit song_path(@song_1.slug)

      expect(page).to have_content("Rating: #{@song_1.rating}")
    end
    it "should display genres for that particular song" do
      visit song_path(@song_1.slug)

      save_and_open_page
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content("Genres for This Song")
      expect(page).to have_content(@genre_1.name)
      expect(page).to have_content(@genre_2.name)
      expect(page).to have_content(@genre_3.name)
      expect(page).to_not have_content(@genre_4.name)
    end
  end
end
