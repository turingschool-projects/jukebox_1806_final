require 'rails_helper'

describe 'visitor visits a genre show page' do
  it 'shows information about genre' do
    artist_1 = Artist.create(name: 'Nicky Fresh')
    genre_1 = Genre.create!(name: 'Funk')
    genre_2 = Genre.create!(name: 'Rap')
    genre_3 = Genre.create!(name: 'Country')
    song_1 = artist_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 3)

    song_1.genres << [genre_1, genre_2]

    visit song_path(song_1.slug)

    expect(page).to have_content('Genres for this Song:')

  end
end
