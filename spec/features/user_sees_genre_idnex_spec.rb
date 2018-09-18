require 'rails_helper'

describe 'genre index' do
  it 'visitor can see all genres' do
    genre_1 = Genre.create(name: "Jazz")
    genre_2 = Genre.create(name: "Blues")
    

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to_not have_content('Submit')
  end
  
  describe 'As an Admin' do
    describe 'they can see a form to create new genre' do 
      it 'they can create a new genre' do
        genre_1 = Genre.create(name: "Jazz")
        genre_2 = Genre.create(name: "Blues")
        admin = User.create(username: 'Rajaa', password: '123', role: 1)
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        
        visit genres_path
        
        fill_in :genre_name, with: 'House'
        click_on 'Submit'
        
        expect(page).to have_content(genre_1.name)
        expect(page).to have_content(genre_2.name)
        expect(page).to have_content(Genre.last.name)
      end
    end
  end
  
  describe 'Visitor' do 
    it 'they can link to genre show page from the index page' do 
      genre_1 = Genre.create(name: "Jazz")
      genre_2 = Genre.create(name: "Blues")

      visit genres_path
      click_on 'Jazz'
      
      expect(current_path).to eq(genre_path(genre_1))
    end
  end
end