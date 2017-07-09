class Photo < ApplicationRecord
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  belongs_to :reports, optional: true
  belongs_to :tips, optional: true
  belongs_to :user, optional: true

  def self.first_image
    if first
      first.image.url
    else
      'http://purplehippodesign.co.uk/wp-content/uploads/2016/06/favicon.png'
    end
  end

  def self.tip_image
    if first
      first.image.url
    else
      'http://purplehippodesign.co.uk/wp-content/uploads/2016/06/favicon.png'
    end
  end

  def self.user_image
    if first
      first.image.url
    else
      'http://iseh.co.uk/images/noimage.png'
    end
  end

end
