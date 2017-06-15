class Location < ApplicationRecord
  has_many :tips
  has_many :destinations 
  has_many :reports, through: :destinations

  validates :city, :country, presence: true

end
