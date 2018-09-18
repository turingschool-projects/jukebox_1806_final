require 'rails_helper'

describe 'genre show' do
  describe 'as a visitor' do
    it "shows one genre" do
      genre_1 = Genre.create!(name: "Black Metal")
      genre_2 = Genre.create!(name: "Death Metal")
      artist_1 = Artist.create(name: "Rick James")
      song_1 = genre_1.songs.create!(title: 'Funeral Thirst', length: 300, play_count: 5000000, artist_id: artist_1.id)
      song_2 = genre_1.songs.create(title: 'Mordecai', length: 200, play_count: 10000, artist_id: artist_1.id)
      song_3 = genre_2.songs.create(title: 'SuperFreak', length: 200, play_count: 10, artist_id: artist_1.id)

      visit genres_path

      click_on "Black Metal"

      expect(current_path).to eq(genre_path(genre_1))
      expect(page).to have_content(genre_1.name)
      expect(page).to_not have_content(genre_2.name)
      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end
  end
end
