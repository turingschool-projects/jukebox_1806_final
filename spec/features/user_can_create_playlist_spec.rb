require 'rails_helper'

describe 'playlist creation' do
  it 'should create a playlist' do
    playlist_title = 'Funky Beats 2018'
    visit new_playlist_path

    fill_in 'playlist[name]', with: playlist_title
    click_button 'Create Playlist'

    expect(current_path).to eq(playlist_path(Playlist.last))
    expect(page).to have_content(playlist_title)
  end
end
