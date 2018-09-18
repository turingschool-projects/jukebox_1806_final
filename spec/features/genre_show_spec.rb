require 'rails_helper'

describe 'Visit genre show' do
  context 'as a visitor' do
    it 'should show the genres songs' do
      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 3)
      song_3 = artist_2.songs.create(title: 'Penny Nickel', length: 200, play_count: 10000, rating: 3)
      SongGenre.create!(song: song_1, genre: genre_1)
      SongGenre.create!(song: song_2, genre: genre_1)
      SongGenre.create!(song: song_3, genre: genre_2)


      visit genre_path(genre_1)

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)


    end
    it 'should show the average rating' do
      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 4)
      song_3 = artist_2.songs.create(title: 'Penny Nickel', length: 200, play_count: 10000, rating: 3)
      SongGenre.create!(song: song_1, genre: genre_1)
      SongGenre.create!(song: song_2, genre: genre_1)
      SongGenre.create!(song: song_3, genre: genre_2)


      visit genre_path(genre_1)

      expect(page).to have_content("Average Rating 3.0")


    end
  end
end
