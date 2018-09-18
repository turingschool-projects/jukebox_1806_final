require 'rails_helper'

describe 'genre index' do
  it 'user can see all genres' do
    genre_1 = Genre.create(name: 'Death Metal')
    genre_2 = Genre.create(name: 'Funk')
    genre_3 = Genre.create(name: 'Jazz')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
    expect(page).to have_link(genre_1.name)
    expect(page).to have_link(genre_2.name)
    expect(page).to have_link(genre_3.name)
  end
end
