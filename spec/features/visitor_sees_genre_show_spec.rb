require 'rails_helper'

describe 'visitor visits a genre index page' do
  it 'shows information about genre' do
    genre_1 = Genre.create(name: 'Funk')
    genre_2 = Genre.create(name: 'Rap')
    song_1 = genre_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 3)
    song_2 = genre_1.songs.create(title: 'Brick House', length: 300, play_count: 5000000, rating: 3)
    song_3 = genre_2.songs.create(title: 'Ice Ice Baby', length: 300, play_count: 5000000, rating: 3)

    visit genre_path(genre_1)

    expect(page).to have_content(genre_1.name)
    expect(page).to_not have_content(song_3.title)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end
end
