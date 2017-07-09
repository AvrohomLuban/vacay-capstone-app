class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reports
  has_many :tips
  has_many :likes
  has_many :comments
  has_many :guides
  has_many :questions
  has_many :answers
  has_many :bookmarks
  has_many :photos

  def posts
    return self.comments.count + self.reports.count + self.questions.count + self.answers.count
  end

end
