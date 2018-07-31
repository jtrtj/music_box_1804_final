class Song < ApplicationRecord
  validates_presence_of :title, :length, :play_count
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  before_save :generate_slug


  def to_param
    slug
  end

  def generate_slug
    self.slug = title.parameterize
  end

  def three_songs_with_same_rating
    Song.where(rating: self.rating).limit(3) #need to figure out how to to not include 'self'
  end
end
