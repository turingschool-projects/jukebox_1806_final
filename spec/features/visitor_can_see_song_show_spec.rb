require 'rails_helper'

describe 'visitor visits a song show page' do
  it 'shows information about song ' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 3)

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content(song_1.play_count)
    
  end
end
