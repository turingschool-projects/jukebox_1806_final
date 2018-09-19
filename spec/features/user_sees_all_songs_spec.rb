# User Story #5
# As a Visitor,
#   When I visit the song index,
#     Under each song title listed,
#     I also see a heading that says "Awards for this Song:"
#     I also see each award the song have won
#     I also see what year the award was won
#
# Testing requirements:
# - users should see at least 2 songs on the page
# - each song should have at least 2 awards
require 'rails_helper'

describe 'song index' do
  it 'user can see all songs' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
