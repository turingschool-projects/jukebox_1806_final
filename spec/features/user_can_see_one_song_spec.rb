require "rails_helper"

describe "As a visitor" do
  describe "when I visit a song show" do
    it 'should show all genres' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Artist 2")
      genre_1 = Genre.create!(name: "Alternative")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Funk")
      genre_4 = Genre.create!(name: "Not This One")
      song = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song_2 = artist_1.songs.create(title: 'Song 2', length: 113, play_count: 24346, rating: 2)
      song_3 = artist_2.songs.create(title: 'Song 3', length: 400, play_count: 50346000, rating: 5)
      song_4 = artist_2.songs.create(title: 'Song 4', length: 231, play_count: 3463, rating: 2)
      song_5 = artist_1.songs.create(title: 'Song 5', length: 412, play_count: 26833, rating: 2)
      song.genres << genre_1
      song.genres << genre_2
      song.genres << genre_3

      visit song_path(song.slug)

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
      expect(page).to_not have_content(genre_4.name)

      within('.similar-songs') do
        expect(page).to have_content(song_2.title)
        expect(page).to have_content(song_4.title)
        expect(page).to have_content(song_5.title)
        expect(page).to_not have_content(song_3.title)
      end
    end
  end
end
