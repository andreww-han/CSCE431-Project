class Event < ApplicationRecord

    has_many :member_points, dependent: :destroy

end
