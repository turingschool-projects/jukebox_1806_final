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
      genre_2 = Genre.create(name: "Funk")
      genre_2.songs.create!(title: "Mount Crushmore",
                          artist: artist,
                          length: 100,
                          play_count: 50,
                          rating: 5)
      visit genre_path(genre)

      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre.songs.first.title)
      expect(page).to have_content(genre.songs.last.title)
      expect(page).to_not have_content(genre_2.songs.first.title)
    end
  end
end
