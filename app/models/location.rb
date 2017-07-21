class Location < ApplicationRecord
  validates :city, :state, :country, presence: true
  has_many :tips
  has_many :destinations 
  has_many :reports, through: :destinations
  has_many :guide_locations
  has_many :guides, through: :guide_locations
  has_many :questions

  validates :city, :country, presence: true

  def self.display_image
    if first
      first.image.url
    else
      'http://iseh.co.uk/images/noimage.png'
    end
  end

end
