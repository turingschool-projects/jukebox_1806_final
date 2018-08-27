require 'rails_helper'

describe 'As a user' do
  describe 'visits artists/new' do
    it 'should see a form for new artist' do
      artist_name = "Outkast"

      visit '/artists/new'

      fill_in "artist[name]", with: artist_name
      click_on "Create Artist"

      expect(current_path).to eq('/artists')
      expect(page).to have_content(artist_name)
    end
  end
end
