require 'rails_helper'

describe 'user visits genre index' do
  it 'displays all genres' do
    genre1 = Genre.create!(name: "Pop")
    genre2 = Genre.create!(name: "Rock")

    user = User.create(username: "person", password: "person")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)

  end
end
