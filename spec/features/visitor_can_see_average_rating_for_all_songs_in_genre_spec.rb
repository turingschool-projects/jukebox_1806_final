require 'rails_helper'

describe 'as a visitor' do
  describe 'on genre show page' do
    it 'sees an average rating for all songs in this genre' do
      artist = Artist.create(name: "Bob")
      song = artist.songs.create!(title: "Ajio",
                                  length: 100,
                                  play_count: 50,
                                  rating: 1)
      genre = Genre.create(name: "Dance")
      song_2 = genre.songs.create!(title: "Basdf",
                                  length: 100,
                                  artist: artist,
                                  play_count: 50,
                                  rating: 3)
      song_3 = genre.songs.create!(title: "Cerdfa",
                                  length: 100,
                                  artist: artist,
                                  play_count: 50,
                                  rating: 5)
      visit genre_path(genre)
      save_and_open_page
      expect(page).to have_content("Average rating for songs of this genre: #{genre.average_song_rating}")

    end
  end
end
