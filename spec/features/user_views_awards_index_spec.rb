# ## User Story #1
#
# As a Visitor,
#   When I visit the awards index,
#     I see all awards
#       and each award should be a link to that award's show page.
#
# Testing requirements:
# - users should see at least 2 awards listed on the page
# Admin User

# ## User Story #2
#
# As an admin user,
#   When I visit the same awards index page that visitors see,
#     I can see a form to create a new award
#
# Testing requirements:
# - users should see at least 2 awards listed on the page, plus the form

require 'rails_helper'

describe 'award index' do
  award_1 = Award.create!(name: "golden globe", year: 2002)
  award_2 = Award.create!(name: "golden globe", year: 2002)

  before do
    visit awards_path
  end

  describe 'as a visitor' do
    it 'visitor can see all awards' do

      expect(page).to have_link(award_1.name)
      expect(page).to have_link(award_2.name)
      expect(page).to_not have_content("Create a new award:")
      expect(page).to_not have_content("Name")
      expect(page).to_not have_content("Year")
      expect(page).to_not have_button("Create Award")
    end
  end
  describe 'as a user' do
    it 'user can see all awards' do
      user = User.create(username: "Elfo", password: "enchanted", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(page).to have_link(award_1.name)
      expect(page).to have_link(award_2.name)
      expect(page).to_not have_content("Create a new award:")
      expect(page).to_not have_content("Name")
      expect(page).to_not have_content("Year")
      expect(page).to_not have_button("Create Award")
    end
  end
  describe 'as an admin' do
    it 'admin can see all awards and a create award form' do
      admin = User.create!(username: "Dumbledore", password: "hogwarts", password_confirmation: "hogwarts", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      # binding.pry
      expect(page).to have_link(award_1.name)
      expect(page).to have_link(award_2.name)
      expect(page).to have_content("Create a new award:")
      expect(page).to have_content("Name")
      expect(page).to have_content("Year")
      expect(page).to have_button("Create Award")
    end
  end
end
