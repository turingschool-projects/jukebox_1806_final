require 'rails_helper'

describe 'genre show' do
  it 'visitor can see numeric rating for genre' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
    song_3 = artist_1.songs.create(title: 'Bad Mamajama', length: 100, play_count: 10000000, rating: 5)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 2)
    genre_1 = Genre.create(title: "Funk", songs: [song_1, song_3])
    genre_2 = Genre.create(title: "Rap", songs: [song_2])

    visit genre_path(genre_1)

    expect(page).to have_content(genre_1.title)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_3.title)
    expect(page).to_not have_content(song_2)
  end
  it 'visitor can see average_rating_of_songs for genre' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
    song_3 = artist_1.songs.create(title: 'Bad Mamajama', length: 100, play_count: 10000000, rating: 5)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 2)
    genre_1 = Genre.create(title: "Funk", songs: [song_1, song_3])
    genre_2 = Genre.create(title: "Rap", songs: [song_2])

    visit genre_path(genre_1)

    expect(page).to have_content("Average Rating for Songs in this Genre: #{genre_1.average_rating_of_songs}")
    expect(page).to_not have_content("Average Rating for Songs in this Genre: #{genre_2.average_rating_of_songs}")
  end
end
