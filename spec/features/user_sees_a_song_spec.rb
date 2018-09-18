require 'rails_helper'

describe 'Song Show Page' do
  describe 'A user visits a song show page' do
    it 'shows attributes of the song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 1)

      visit song_path(song_1.slug)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_1.artist.name)
      expect(page).to have_content("Length: #{song_1.length}") 
      expect(page).to have_content("Play Count: #{song_1.play_count}") 
      expect(page).to have_content("Rating: #{song_1.rating}") 
    end
    it 'shows all genres assigned to the song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 1)
      genre1 = song_1.genres.create(name: "Trip Hop")
      genre2 = song_1.genres.create(name: "Weirdness")
      genre3 = song_2.genres.create(name: "Classical")

      visit song_path(song_1.slug)

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)

      expect(page).to_not have_content(genre3.name)
    end
  end
end