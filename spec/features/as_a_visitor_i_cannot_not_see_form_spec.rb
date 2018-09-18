require 'rails_helper'

describe 'visitor visits genre index page' do
  it 'should not display a form to create a new genre but can see links' do
    genre1 = Genre.create(name: 'Pop')
    genre2 = Genre.create(name: 'Wizard Rock')
    visit genres_path

    expect(page).to_not have_content("Create A New Genre")
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)

    click_on genre1.name
    expect(current_path).to eq(genre_path(genre1))
  end
end
