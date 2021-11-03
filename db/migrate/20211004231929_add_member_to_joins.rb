class AddMemberToJoins < ActiveRecord::Migration[6.1]
  def change
    add_reference :joins, :member, null: false, foreign_key: true
  end
end
