require 'rails_helper'

describe 'genre index' do
  it 'user can see all genres' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    genre_1 = Genre.create(title: "Funk", songs: [song_1])
    genre_2 = Genre.create(title: "Rap", songs: [song_2])

    visit genres_path

    expect(page).to have_content(genre_1.title)
    expect(page).to have_content(genre_2.title)
  end
end
