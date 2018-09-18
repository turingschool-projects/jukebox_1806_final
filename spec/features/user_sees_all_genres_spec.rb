require 'rails_helper'

describe 'Genre Index Page' do
  describe 'As user visits the genre index page' do
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
    it 'should not show form to create a new genre' do
      genre1 = Genre.create(name: 'Dance')		
      genre2 = Genre.create(name: 'Theater')	
     
      visit genres_path

      within("#genre-#{genre1.id}") do
        expect(page).to have_content(genre1.name) 
      end 

      within("#genre-#{genre2.id}") do
        expect(page).to have_content(genre2.name)  
      end 

      expect(page).to_not have_content("Create New Genre")
    end
  end
end