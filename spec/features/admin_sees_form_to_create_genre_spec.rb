require 'rails_helper'

describe 'Genre Index Page' do
  describe 'As an admin when I  visit the genre index page' do
    it 'should list all genres' do
      genre1 = Genre.create(name: 'Dance')		
      genre2 = Genre.create(name: 'Theater')	
      genre3 = Genre.create(name: 'Rock')	
      genre4 = Genre.create(name: 'Folk')	
      genre5 = Genre.create(name: 'Jazz')		

      visit genres_path
     
      within("#genre-#{genre1.id}") do
        expect(page).to have_content(genre1.name) 
      end 

      within("#genre-#{genre2.id}") do
        expect(page).to have_content(genre2.name)  
      end 

      within("#genre-#{genre3.id}") do
        expect(page).to have_content(genre3.name)  
      end 

      within("#genre-#{genre4.id}") do
        expect(page).to have_content(genre4.name)  
      end 

      within("#genre-#{genre5.id}") do
        expect(page).to have_content(genre5.name)  
      end 
    end
    it 'should form to create a new genre' do
      admin = User.create(username: "Dione", password: "pasword", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Dance')		
      genre2 = Genre.create(name: 'Theater')	
     
      visit genres_path

      within("#genre-#{genre1.id}") do
        expect(page).to have_content(genre1.name) 
      end 

      within("#genre-#{genre2.id}") do
        expect(page).to have_content(genre2.name)  
      end 

      expect(page).to have_content("Create New Genre")
    end
    it 'allows me to create a new genre' do
      admin = User.create(username: "Dione", password: "pasword", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Dance')		
      genre2 = Genre.create(name: 'Theater')	
     
      visit genres_path

      fill_in :genre_name, with: "Funk"
      click_on "Create Genre"
      expect(current_path).to eq(genres_path)

      expect(page).to have_content("Funk") 
    end
  end
end