require "rails_helper"

describe "As a visitor" do
  describe "when I visit a song show" do
    it 'should show all genres' do
      artist_1 = Artist.create(name: "Rick James")
      genre_1 = Genre.create!(name: "Alternative")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Funk")
      genre_4 = Genre.create!(name: "Not This One")
      song = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song.genres << genre_1
      song.genres << genre_2
      song.genres << genre_3

      visit song_path(song.slug)

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
      expect(page).to_not have_content(genre_4.name)
    end
  end
end
