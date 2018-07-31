class Song < ApplicationRecord
  validates_presence_of :title, :length, :play_count
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }

  before_save :generate_slug


  def to_param
    slug
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
