class AddIsOwnerToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :isOwner, :boolean, default: false
  end
end
