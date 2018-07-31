class SongGenre < ApplicationRecord
  validates_presence_of :song_id, :genre_id

  belongs_to :song
  belongs_to :genre
end