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


    fill_in :genre_name, with: "Trip"

    click_on 'Create Genre'
save_and_open_page
    expect(page).to have_content('Trip')
  end
end
