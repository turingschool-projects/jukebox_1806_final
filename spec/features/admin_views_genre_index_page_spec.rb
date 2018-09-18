# As an admin user,
#   When I visit the same genre index page that visitors see,
#   I see the same information visitors see,
#     And I also see a form to create a new genre.

require 'rails_helper'

describe 'genre index' do
  describe 'as an admin' do
    scenario 'admin can also see all genres' do
      genre_1 = Genre.create!(name: "Folk")
      genre_2 = Genre.create!(name: "Jazz")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
    scenario 'admin can also see a form to create a new genre' do
      admin = User.create!(username: "Dr.Who", password: "blue", password_confirmation: "blue", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


      visit genres_path

      expect(page).to have_content("Create new genre:")
      expect(page).to have_content("Name:")
      expect(page).to have_button("Create Genre")
    end
  end
  context 'as default user' do
    scenario 'I can not see admin create genre form' do
      user = User.create!(username: "Rory", password: "Amelia", password_confirmation: "Amelia", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to_not have_content("Create new genre:")
      expect(page).to_not have_button("Create Genre")
    end
  end
  context 'as visitor' do
    scenario 'I can not see admin create genre show form' do
      visit genres_path

      expect(page).to_not have_content("Create new genre:")
      expect(page).to_not have_button("Create Genre")
    end
  end
end
