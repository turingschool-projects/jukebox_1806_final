require 'rails_helper'

describe 'as a visitor' do
  describe 'on a genre show page' do
    it 'shows all songs associated with that genre' do
      artist = Artist.create(name: "Bob")
      song = artist.songs.create!(title: "A",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)
      genre = song.genres.create(name: "Dance")
      genre.songs.create!(title: "B",
                          artist: artist,
                          length: 100,
                          play_count: 50,
                          rating: 5)

      visit genre_path(genre)

      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre.songs.first.title)
      expect(page).to have_content(genre.songs.last.title)
    end
  end
end
