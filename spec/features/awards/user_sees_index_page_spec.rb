require 'rails_helper'

describe "user visit index page" do
  it "show all awards" do
    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)

    visit awards_path

    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
  end
  it "user can't create a award" do
    award_1 = Award.create(name: "Rock")
    award_2 = Award.create(name: "Classical")

    visit awards_path

    expect(page).to_not have_field(:award_name)
		expect(page).to_not have_button('Create Award')
    expect(page).to_not have_content("Create a New Award")
  end
  it "user can link to award show page" do
    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)

    visit awards_path

    click_on "Grammy"

    expect(current_path).to eq(award_path(award_1))
    expect(page).to have_content(award_1.name)
  end
  it "user starts on index then sees show page" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

    award_1 = Award.create(name: "Grammy", year: 1999)
    award_2 = Award.create(name: "MTV Award", year: 1997)
    award_3 = Award.create(name: "Chicago", year: 2003)
    award_4 = Award.create(name: "Denver", year: 1993)

    song_1.awards << [award_1, award_3]
    song_2.awards << [award_1, award_4]

    visit awards_path

    click_on "Grammy"


    expect(page).to have_content("Songs Recieving this award:")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(award_1.year)
  end
end
