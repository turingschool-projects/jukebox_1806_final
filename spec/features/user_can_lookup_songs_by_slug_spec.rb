require 'rails_helper'

describe 'song slugs' do
  describe 'user can find songs by a slug instead of integer id' do
    it 'should find the correct song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

      visit song_path(song_1.slug)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_1.artist.name)
      expect(page).to have_content(song_1.rating)
    end
  end
  describe 'It shows the genres associated with the song' do
    it 'should find the correct song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      genre_3 = Genre.create!(name: 'COUNTRY')
      SongGenre.create!(song: song_1, genre: genre_1)
      SongGenre.create!(song: song_1, genre: genre_2)

      visit song_path(song_1.slug)


      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to_not have_content(genre_3.name)
    end
  end
end
