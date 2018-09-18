require 'rails_helper'

describe 'song show' do
  it 'user can see song details' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content("Rating: #{song_1.rating}")
  end
end
