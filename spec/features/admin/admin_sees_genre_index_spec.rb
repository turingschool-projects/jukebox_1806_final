require 'rails_helper'

describe 'admin visits a genre index page' do
  it 'shows information about genre' do
    genre_1 = Genre.create(name: 'Funk')
    genre_2 = Genre.create(name: 'Rap')
    admin = User.create(username: "Ian", password: "test123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)

    new_genre = 'Trip Hop'
    fill_in 'genre[name]', with: new_genre

    click_button 'Create Genre'

    expect(page).to have_content(new_genre)
  end
end
