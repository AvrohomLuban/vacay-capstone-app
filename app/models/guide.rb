class Guide < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :first_name, :last_name, :price, presence: true


  belongs_to :user
  has_many :guide_locations
  has_many :locations, through: :guide_locations
end
