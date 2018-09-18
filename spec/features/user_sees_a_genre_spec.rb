require 'rails_helper'

describe "Genre Show Page" do
  describe "A visitor visits a genre show page do" do
    it 'shows songs associated with the genre on the page' do
      genre1 = Genre.create(name: "Hip Hop")
      genre2 = Genre.create(name: "Classical")
      song1 = genre1.songs.create(title: 'Song 1', length: 130, play_count: 10, rating: 4)
      song2 = genre1.songs.create(title: 'Song 2', length: 330, play_count: 30, rating: 4)
      song3 = genre2.songs.create(title: 'Song 3', length: 100, play_count: 5, rating: 5)
      visit genre_path(genre1)
      save_and_open_page

      expect(page).to have_content(song1.title) 
      expect(page).to have_content(song2.title) 

      expect(page).to_not have_content(song3.title)
    end
  end
end
