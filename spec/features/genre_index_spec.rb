require 'rails_helper'

describe 'Visit genre index' do
  context 'as a visitor' do
    it 'should show all songs' do

      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
    it 'should NOT have a new form' do
      user = User.create!(username: 'pat', password: '1234', role: 0)

      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit genres_path



      expect(page).to_not have_content('Sumbit')

    end
    it 'should link to the genre show' do
      user = User.create!(username: 'pat', password: '1234', role: 0)

      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      visit genres_path

      click_on genre_1.name


      expect(current_path).to eq(genre_path(genre_1))
      expect(page).to_not have_content(genre_2.name)

    end
  end
  context 'as anadmin' do
    it 'should have a new form' do
      admin = User.create!(username: 'pat', password: '1234', role: 1)

      genre_1 = Genre.create!(name: 'Dance')
      genre_2 = Genre.create!(name: 'Folk')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit genres_path


      fill_in 'genre[name]', with: 'Potato'
      click_on 'Submit'

      expect(page).to have_content('Potato')

    end
  end
end
