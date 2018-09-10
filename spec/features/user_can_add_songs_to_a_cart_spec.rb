require 'rails_helper'

describe 'When a user adds songs to their cart' do
  it 'a message is displayed' do
    artist = Artist.create(name: "Prince")
    song = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445)

    visit songs_path

    click_on "Add Song"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it "the message correctly increments for multiple songs" do
    artist = Artist.create(name: "Prince")
    song = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445)

    visit songs_path

    click_on "Add Song"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    click_on "Add Song"

    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end

  it "the total number of songs in the cart increments" do
    artist = Artist.create(name: "Prince")
    song = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445)

    visit songs_path

    expect(page).to have_content("Cart: 0")

    click_on "Add Song"

    expect(page).to have_content("Cart: 1")
  end
end
