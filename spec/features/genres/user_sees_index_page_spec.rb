require 'rails_helper'

describe "user sees index page" do
  it "shows all genres" do
    artist = Artist.create(name: "Prince")
    song = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445, rating:5)
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Jazz")

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end
  xit "allows admin to create a genre" do
    admin = User.create(username: "Admin", password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      new_genre = "Classical"

      visit genres_path

      fill_in :name, with: "Classical"

      click_on "Create Genre"

      expect(current_path).to equal(genres_path)
      expect(page).to have_content("Classical")
  end
  it "allows user to click on genre name and go to its show page" do
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Jazz")

    visit genres_path

    click_on "Rock"

    expect(current_path).to eq(genre_path(genre_1))
    expect(page).to have_content(genre_1.name)
  end
  it "shows all songs associated with that genre" do
    artist = Artist.create(name: "Prince")
    song_1 = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445, rating:5)
    song_2 = artist.songs.create(title: "When Doves Cry", length: 209, play_count: 3445, rating:5)
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Jazz")


    genre_1.songs << [song_1, song_2]
    genre_2.songs << [song_1, song_2]

    visit genre_path(genre_1)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end

end
