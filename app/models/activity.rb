class Activity < ApplicationRecord

    has_many :member_points, dependent: :destroy
    has_many :events, dependent: :destroy

end
