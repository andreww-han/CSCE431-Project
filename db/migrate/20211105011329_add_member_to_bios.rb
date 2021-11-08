class AddMemberToBios < ActiveRecord::Migration[6.1]
  def change
    add_reference :bios, :member, null: false, foreign_key: true
  end
end
