require 'rails_helper'

describe "Genre Show Page" do
  describe "A visitor visits a genre show page do" do
    it 'shows songs associated with the genre on the page' do
      genre1 = Genre.create(name: "Hip Hop")
      genre2 = Genre.create(name: "Classical")
      artist = Artist.create(name: "Artist")
      song1 = genre1.songs.create(title: 'Song 1', length: 130, play_count: 10, artist_id: artist.id, rating: 4)
      song2 = genre1.songs.create(title: 'Song 2', length: 330, play_count: 30, artist_id: artist.id, rating: 4)
      song3 = genre2.songs.create(title: 'Song 3', length: 100, play_count: 5, artist_id: artist.id, rating: 5)
      
      visit genre_path(genre1)

      expect(page).to have_content(song1.title) 
      expect(page).to have_content(song2.title) 

      expect(page).to_not have_content(song3.title)
    end
    it 'shows average rating of songs for that genre' do
      genre1 = Genre.create(name: "Hip Hop")
      genre2 = Genre.create(name: "Classical")
      artist = Artist.create(name: "Artist")
      song1 = genre1.songs.create(title: 'Song 1', length: 130, play_count: 10, artist_id: artist.id, rating: 3)
      song2 = genre1.songs.create(title: 'Song 2', length: 330, play_count: 30, artist_id: artist.id, rating: 4)
      song3 = genre2.songs.create(title: 'Song 3', length: 100, play_count: 5, artist_id: artist.id, rating: 5)

      visit genre_path(genre1)

      expect(page).to have_content("Average Song Rating: #{genre1.average_rating}") 

      expect(page).to_not have_content("Average Song Rating: #{genre2.average_rating}") 
    end
  end
end
