class AddMeetingToJoins < ActiveRecord::Migration[6.1]
  def change
    add_reference :joins, :meeting, null: false, foreign_key: true
  end
end
