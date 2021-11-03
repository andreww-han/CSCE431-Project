class AddMemberToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :member, null: false, foreign_key: true
  end
end
