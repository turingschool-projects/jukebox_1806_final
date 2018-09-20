require 'rails_helper'

describe 'admin creates an award' do
  it 'displays form to create award on award index' do
    admin = User.create(username: "Becca", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit awards_path

    expect(page).to have_content("Create a New Award")
  end
end
