require 'rails_helper'

describe 'user sees all awards' do
  context 'as a visitor' do
    it 'displays all awards linking to individual awards pages' do
      award_1 = Award.create!(name: "Award 1")
      award_2 = Award.create!(name: "Award 2")
      award_3 = Award.create!(name: "Award 2")

      visit awards_path

      expect(page).to have_content(award_1.name)
      expect(page).to have_content(award_2.name)
      expect(page).to have_content(award_3.name)

    end
  end
end
