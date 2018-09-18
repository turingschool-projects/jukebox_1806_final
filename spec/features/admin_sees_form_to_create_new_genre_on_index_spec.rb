require 'rails_helper'

describe 'admin visits genre index page' do
  it 'should display a form to create a new genre' do
    genre1 = Genre.create(name: 'Pop')
    genre2 = Genre.create(name: 'Wizard Rock')
    admin = User.create!(username: "Finn", password: "123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit genres_path

    expect(page).to have_content("Create A New Genre")
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)

    fill_in :genre_name, with: "Pop Punk"
    click_on "Create Genre"

    expect(current_path).to eq(genres_path)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(Genre.last.name)

  end
end
