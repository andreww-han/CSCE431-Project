class Member < ApplicationRecord
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :member_points, dependent: :destroy
  has_one :bio, dependent: :destroy
end
