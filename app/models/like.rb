class Like < ApplicationRecord
    validates :member_id, :presence => true
    validates :post_id, :presence => true
end
