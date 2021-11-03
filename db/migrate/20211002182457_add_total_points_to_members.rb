class AddTotalPointsToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :totalPoints, :integer, default: 0
  end
end
