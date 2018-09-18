require 'rails_helper'

describe 'admin visits genres index' do
  it 'displays a form to create a genre' do
    admin = User.create(username: "Becca", password: "unicorn", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    genre1 = Genre.create!(name: "Pop")
    genre2 = Genre.create!(name: "Rock")

    visit genres_path

    expect(page).to have_content("Create New Genre")

  end

  it 'fills in a form to create a genre, new genre appears on index' do
    admin = User.create(username: "Becca", password: "unicorn", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    genre1 = Genre.create!(name: "Pop")
    genre2 = Genre.create!(name: "Rock")

    visit genres_path

    fill_in "genre[name]", with: "Classical"
    click_on "Create Genre"

    expect(current_path).to eq(genres_path)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(Genre.last.name)

  end
end
