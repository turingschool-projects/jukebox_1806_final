require 'rails_helper'

describe 'admin visits a genre index page' do
  it 'shows information about genre' do
    genre_1 = Genre.create(name: 'Funk')
    genre_2 = Genre.create(name: 'Rap')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)

    new_genre = 'Trip Hop'
    fill_in :song_title, with: song_title
    fill_in :song_length, with: 200

  end
end
