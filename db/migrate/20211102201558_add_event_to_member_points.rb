class AddEventToMemberPoints < ActiveRecord::Migration[6.1]
  def change
    add_reference :member_points, :event, null: false, foreign_key: true
  end
end
