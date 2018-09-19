# ## User Story #3
#
# As an admin user,
#   When I visit that same awards index page,
#   When I fill out the form with the award's title,
#     And click 'Create Award',
#     I see a list of all awards including the one I have just created.
#
# Testing requirements:
# - users should see at least 2 awards listed on the page, plus the new one created
# Visitor (unregistered user, not logged in)

require 'rails_helper'

describe 'award index' do
    award_1 = Award.create!(name: "golden globe", year: 2002)
    award_2 = Award.create!(name: "golden globe", year: 2002)

  describe 'as an admin' do
    it 'admin can see all awards and a create award form' do
      admin = User.create!(username: "Dumbledore", password: "hogwarts", password_confirmation: "hogwarts", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit awards_path
      fill_in :award_name, with: "wizard"
      fill_in :award_year, with: 2011
      click_on "Create Award"

      new_award = Award.last

      expect(page).to have_link(new_award.name)

      expect(page).to have_link(award_1.name)
      expect(page).to have_link(award_2.name)
      expect(page).to have_content("Create a new award:")
      expect(page).to have_content("Name")
      expect(page).to have_content("Year")
      expect(page).to have_button("Create Award")
    end
  end
end
