class Location < ApplicationRecord
  has_many :tips
  has_many :destinations 
  has_many :reports, through: :destinations
  has_many :guide_locations
  has_many :guides, through: :guide_locations
  has_many :questions

  validates :city, :country, presence: true

end
