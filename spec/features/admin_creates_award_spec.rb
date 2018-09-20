require 'rails_helper'

describe 'admin creates an award' do
  it 'displays form to create award on award index' do
    admin = User.create(username: "Becca", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit awards_path

    expect(page).to have_content("Create a New Award")
  end

  it 'displays created award in index' do
    admin = User.create(username: "Becca", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit awards_path

    fill_in :award_name, with: "Award 4"

    click_on "Create Award"

    expect(current_path).to eq(awards_path)
    expect(page).to have_content(Award.last.name)
  end
end
