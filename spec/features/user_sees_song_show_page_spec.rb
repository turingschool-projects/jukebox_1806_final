require 'rails_helper'

describe 'user visits song show page' do
  it "shows song rating" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)

    visit song_path(song_1.slug)

    expect(page).to have_content("Rating: #{song_1.rating}")
  end

end
