require 'rails_helper'

describe 'visitor visits a genre index page' do
  it 'shows information about genre' do
    genre_1 = Genre.create(name: 'Funk')
    genre_2 = Genre.create(name: 'Rap')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to_not have_button("Create Genre")

  end

  it 'should show links to genre show pages' do
    genre_1 = Genre.create(name: 'Funk')
    genre_2 = Genre.create(name: 'Rap')

    visit genres_path

    click_link 'Funk'

    expect(current_path).to eq(genre_path(genre_1))

    expect(page).to have_content(genre_1.name)

  end
end
