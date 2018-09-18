require 'rails_helper'

describe 'song show' do
  it 'user can see song details' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content("Rating: #{song_1.rating}")
  end

  it 'user can see song details' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
    genre_1 = Genre.create(name: 'Death Metal')
    genre_2 = Genre.create(name: 'jazz')
    genre_3 = Genre.create(name: 'funk')
    genre_4 = Genre.create(name: 'classical')

    song_1.genres << genre_1
    song_1.genres << genre_2
    song_1.genres << genre_3

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content("Rating: #{song_1.rating}")
    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
    expect(page).to_not have_content(genre_4.name)
  end
end
