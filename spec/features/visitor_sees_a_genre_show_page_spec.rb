require 'rails_helper'

describe "As a visitor" do
  context "they visit a genre show page" do
    it "they see all songs associated with that genre" do
      genre_1 = Genre.create!(name: "Funk")
      artist_1 = Artist.create(name: "Rick James")
      song_1 = genre_1.songs.create(artist_id: artist_1.id, title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song_2 = genre_1.songs.create(artist_id: artist_1.id, title: 'Mary Jane', length: 300, play_count: 5000000, rating: 2)
      song_3 = artist_1.songs.create(title: "Some Other Song", length: 300, play_count: 5000000, rating: 2)

      visit genre_path(genre_1)

      expect(page).to have_content("Superfreak")
      expect(page).to have_content("Mary Jane")
      expect(page).to_not have_content("Some Other Song")

    end

    it "shows an average rating for all songs" do
      genre_1 = Genre.create!(name: "Funk")
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Michael Jackson")
      song_1 = genre_1.songs.create(artist_id: artist_1.id, title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
      song_2 = genre_1.songs.create(artist_id: artist_1.id, title: 'Mary Jane', length: 300, play_count: 5000000, rating: 3)
      song_3 = artist_2.songs.create(title: "Billie Jean", length: 3000, play_count: 5000000, rating: 3)
      visit genre_path(genre_1)

      expect(page).to have_content("Average Rating: 2")
    end
  end
end
