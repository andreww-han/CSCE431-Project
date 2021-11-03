class AddNameToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :name, :string
  end
end
