require 'rails_helper'

describe 'as an Admin' do
  describe 'genre index' do
    it 'admin can create new genre' do
    admin = User.create(username: "admin", password: "12345", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      name = 'Classical'

      fill_in :genre_name, with: name
      click_on('Create Genre')

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(Genre.last.name)
    end
    
    it 'user cant create new genre' do
      user = User.create(username: "admin", password: "12345")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to_not have_content('Create Genre')
    end

    it 'admin redirected to genre index page after creating new genre' do
      admin = User.create(username: "admin", password: "12345", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      genre_1 = Genre.create(name: 'Death Metal')
      genre_2 = Genre.create(name: 'Funk')
      genre_3 = Genre.create(name: 'Jazz')

      visit genres_path

      name = 'Classical'

      fill_in :genre_name, with: name
      click_on('Create Genre')

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(Genre.last.name)
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
    end
  end
end
