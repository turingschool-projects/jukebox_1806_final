require 'rails_helper'

describe "user visit index page" do
  it "show all awards" do
    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)

    visit awards_path

    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
  end
  it "user can't create a award" do
    award_1 = Award.create(name: "Rock")
    award_2 = Award.create(name: "Classical")

    visit awards_path

    expect(page).to_not have_field(:award_name)
		expect(page).to_not have_button('Create Award')
    expect(page).to_not have_content("Create a New Award")
  end

end
