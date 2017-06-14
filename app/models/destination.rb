class Destination < ApplicationRecord
  belongs_to :location
  belongs_to :report, optional:true
  belongs_to :tip, optional: true
end
