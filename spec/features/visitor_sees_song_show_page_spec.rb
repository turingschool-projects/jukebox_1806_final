require 'rails_helper'

describe 'song show' do
  it 'visitor can see song attributes' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Rating: #{song_1.rating}")
  end
    it 'visitor can see song genres' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
      genre_1 = Genre.create(title: "Funk", songs: [song_1])
      genre_2 = Genre.create(title: "Soul", songs: [song_1])
      genre_3 = Genre.create(title: "Rap", songs: [song_2])

      visit song_path(song_1.slug)

      expect(page).to have_content("Genres for this Song:")
      expect(page).to have_content(genre_1.title)
      expect(page).to have_content(genre_2.title)
      expect(page).to_not have_content(genre_3.title)
    end
end
