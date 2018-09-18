require 'rails_helper'

describe 'as a visitor' do
  describe 'visits the genre index' do
    it 'lists all genres in the database' do
      artist = Artist.create(name: "Bob")
      song = artist.songs.create!(title: "A",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)
      song_2 = artist.songs.create!(title: "B",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)
      song.genres.create(name: "Dance")
      song_2.genres.create(name: "Theater")

      visit genres_path

      expect(page).to have_content(song.genres.first)
      expect(page).to have_content(song_2.genres.first)

    end
  end
end
