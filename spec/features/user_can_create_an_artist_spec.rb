require 'rails_helper'

describe 'As a user' do
  describe 'visits artists/new' do
    it 'should see a form for new artist' do
      artist_name = "Outkast"

      visit new_artist_path

      fill_in "artist[name]", with: artist_name
      click_on "Create Artist"

      expect(current_path).to eq(artists_path)
      expect(page).to have_content(artist_name)
    end
  end
end
