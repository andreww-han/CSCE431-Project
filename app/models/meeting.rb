class Meeting < ApplicationRecord


  has_many :joins

  accepts_nested_attributes_for :joins


end
