require 'rails_helper'

describe 'genre index' do
  it 'user can see all genres' do
    genre_1 = Genre.create!(name: 'Hip Hop')
    genre_2 = Genre.create!(name: 'Funk')


    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end
end
