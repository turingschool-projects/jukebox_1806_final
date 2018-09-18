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
end
