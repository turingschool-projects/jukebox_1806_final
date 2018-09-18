require 'rails_helper'

describe 'as a visitor' do
  describe 'visit song show page' do
    it 'has a heading saying Genres for this Song: and
        lists all genres for this song' do
        artist = Artist.create(name: "Bob")
        song = artist.songs.create!(title: "A",
                                    length: 100,
                                    play_count: 50,
                                    rating: 5)
        genre = song.genres.create(name: "Dance")
        genre_2 = song.genres.create(name: "Funk")
        genre_3 = Genre.create(name: "Dancehall")

        visit song_path(song.slug)

        expect(page).to have_content("Genres for this Song:")
        expect(page).to have_content(genre.name)
        expect(page).to have_content(genre_2.name)
        expect(page).to_not have_content(genre_3.name)
      end
    end
  end
