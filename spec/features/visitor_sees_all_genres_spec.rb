require 'rails_helper'

describe 'genre index' do
  it "shows all genres" do
    genre_1 = Genre.create!(name: "Black Metal")
    genre_2 = Genre.create!(name: "Prog Metal")
    genre_3 = Genre.create!(name: "Crust Punk")

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end

  context 'as an admin' do
    it "allows admin to create new genre" do
      admin = User.create(username: 'Tara', password: '1234', role: 1)
      genre_1 = Genre.create!(name: "Black Metal")
      genre_2 = Genre.create!(name: "Prog Metal")
      genre_3 = Genre.create!(name: "Crust Punk")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      expect(page).to_not have_content("Blues")
      fill_in :genre_name, with: "Blues"
      click_on 'Create Genre'

      expect(page).to have_content("Blues")
    end
  end
end
