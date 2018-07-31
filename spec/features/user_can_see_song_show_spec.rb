require 'rails_helper'

describe 'user sees one song' do
  it 'with title and length' do
    artist = Artist.create(name: 'Journey')
    song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 5)
    song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)
    g_1 = Genre.create(name: 'Dance')
    g_2 = Genre.create(name: 'Woohoo')
    g_3 = Genre.create(name: 'Awyeah')
    SongGenre.create(song: song_1, genre: g_1)
    SongGenre.create(song: song_1, genre: g_2)
    SongGenre.create(song: song_2, genre: g_3)

    visit song_path(song_1)

    expect(current_path).to eq("/songs/#{song_1.slug}")

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content("Rating: #{song_1.rating}")
    expect(page).to have_content("Genres for this Song: #{g_1.name} #{g_2.name}")
    expect(page).to_not have_content(g_3.name)
    expect(page).to_not have_content(song_2.title)
    expect(page).to_not have_content(song_2.length)
  end
end
