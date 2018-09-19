# ## User Story #6
#
# As a Visitor,
#   When I visit the awards index,
#     And I click on an award name,
#     I see a page with the awards's title.

## User Story #7
#
# As a Visitor,
#   When I visit the awards index,
#     And I click on an award name,
#     I see all songs which received this award
#     I also see the year each song received its award.
require 'rails_helper'

describe 'award show' do
  describe 'as a visitor' do
    it 'visitor can see all show page for award' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      award_1 = Award.create!(name: "golden globe", year: 2002)
      award_2 = Award.create!(name: "something else", year: 2002)
      song_1 = award_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, artist_id: artist_1.id)
      song_2 = award_1.songs.create(title: 'Shazam', length: 300, play_count: 5000000, artist_id: artist_1.id)
      song_3 = award_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, artist_id: artist_2.id)
      visit award_path(award_1)

      expect(page).to have_content(award_1.name)
      expect(page).to_not have_content(award_2.name)
      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end
  end
end
