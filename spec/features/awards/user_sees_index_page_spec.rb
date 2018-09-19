require 'rails_helper'

describe "user visit index page" do
  it "show all awards" do
    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)

    visit awards_path

    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
  end

end
