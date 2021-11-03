class AddUidToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :uid, :string
  end
end
