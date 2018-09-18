require 'rails_helper'

describe 'a user visits genre index page' do
  it 'shows all genres' do
    genre1 = Genre.create(name: 'Pop')
    genre2 = Genre.create(name: 'Wizard Rock')

    visit genres_path
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)

  end
end
