class Image < ApplicationRecord
  validates :url, presence: true

  belongs_to :report, optional: true
  belongs_to :image, optional: true

  def self.first_image
    if first
      first.url
    else
      'http://purplehippodesign.co.uk/wp-content/uploads/2016/06/favicon.png'
    end
  end

  def self.tip_image
    if first
      first.url
    else
      'http://studmonk.com/blog/wp-content/uploads/2016/08/how-to-crack-neet-2017.jpg'
    end
  end
end