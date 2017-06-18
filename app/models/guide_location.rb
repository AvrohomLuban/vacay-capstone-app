class GuideLocation < ApplicationRecord
  validates :guide_id, :location_id, presence: true

  belongs_to :guide
  belongs_to :location
end
