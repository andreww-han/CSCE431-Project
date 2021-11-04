class CreateMemberPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :member_points do |t|
      t.date :date
      t.integer :points

      t.timestamps
    end
  end
end
