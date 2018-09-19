describe "admin visit index page" do
  it "show all awards" do
    admin = User.create(username: "Admin", password: "1234", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)


    visit awards_path

    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
    expect(page).to have_field(:award_name)
		expect(page).to have_button('Create Award')
    expect(page).to have_content("Create a New Award")
  end

end

# As an admin user,
#   When I visit that same awards index page,
#   When I fill out the form with the award's title,
#     And click 'Create Award',
#     I see a list of all awards including the one I have just created.
#
# Testing requirements:
# - users should see at least 2 awards listed on the page, plus the new one created
