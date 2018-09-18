require 'rails_helper'

describe "As a visitor" do
  context "they visit a song show page" do
    it "displays all genres associated with that song" do
      genre_1 = Genre.create!(name: "Funk")
      artist_1 = Artist.create(name: "Rick James")
      song_1 = genre_1.songs.create!(artist_id: artist_1.id, title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
      song_1.genres.create(name: "Soul")
      song_1.genres.create(name: "Hits")
      Genre.create(name: "SomeOtherGenre")

      visit song_path(song_1.slug)

      expect(page).to have_content("Genres For This Song")
      expect(page).to have_content("Soul")
      expect(page).to have_content("Hits")
      expect(page).to have_content("Funk")
      expect(page).to_not have_content("SomeOtherGenre")
    end
  end
end
