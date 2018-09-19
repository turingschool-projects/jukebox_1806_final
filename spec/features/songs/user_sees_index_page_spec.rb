require 'rails_helper'

describe "user visits index page" do
  it "shows songs name and award and award year" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)
    award_3 = Award.create(name: "Chicago", year: 2003)
    award_4 = Award.create(name: "Denver", year: 1993)

    song_1.awards << [award_1, award_3]
    song_2.awards << [award_2, award_4]

    visit songs_path

    expect(page).to have_content("Awards for this Song:")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(award_1.name)
    expect(page).to have_content(award_2.name)
    expect(page).to have_content(award_3.name)
    expect(page).to have_content(award_4.name)
  end
end
