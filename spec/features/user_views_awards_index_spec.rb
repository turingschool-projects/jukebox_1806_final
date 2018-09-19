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

require 'rails_helper'

describe 'award index' do
  it 'user can see all awards' do
    award_1 = Award.create!(name: "golden globe", year: 2002)
    award_2 = Award.create!(name: "golden globe", year: 2002)
    visit awards_path

    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
  end
end
