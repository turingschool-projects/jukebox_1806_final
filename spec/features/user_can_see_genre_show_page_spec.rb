require 'rails_helper'

describe 'genre show' do
  it 'user can see genre information' do
    genre = Genre.create(name: 'Death Metal')
    artist = Artist.create(name: "Rick James")
    song_1 = artist.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4)

    song_2 = artist.songs.create(title: 'Ice Baby', length: 300, play_count: 5000000, rating: 3)
    song_3 = artist.songs.create(title: 'Mariposa', length: 300, play_count: 5000000, rating: 2)
    song_4 = artist.songs.create(title: 'some song', length: 300, play_count: 5000000, rating: 3)

    genre.songs << song_1
    genre.songs << song_2
    genre.songs << song_3

    visit genre_path(genre)

    expect(page).to have_content(genre.name)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_3.title)
    expect(page).to_not have_content(song_4.title)
    expect(page).to have_content("Avg Song Rating: #{genre.average_song_rating}")


  end
end
