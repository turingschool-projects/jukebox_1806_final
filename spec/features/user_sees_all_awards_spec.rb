require 'rails_helper'

describe 'user sees all awards' do
  context 'as a visitor' do
    it 'displays all awards linking to individual awards pages' do
      award_1 = Award.create!(name: "Award 1")
      award_2 = Award.create!(name: "Award 2")
      award_3 = Award.create!(name: "Award 2")

      visit awards_path

      expect(page).to have_link(award_1.name)
      expect(page).to have_link(award_2.name)
      expect(page).to have_link(award_3.name)

      click_on("#{award_1.name}")

      expect(current_path).to eq(award_path(award_1))

    end

    it 'does not display create award form' do
      visitor = User.create(username: "Becca", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(visitor)

      visit awards_path

      expect(page).to_not have_content("Create a New Award")
    end
  end
end
