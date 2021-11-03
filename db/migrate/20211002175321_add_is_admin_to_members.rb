class AddIsAdminToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :isAdmin, :boolean, default: false
  end
end
