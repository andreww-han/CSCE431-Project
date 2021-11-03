class AddDateToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :date, :date
  end
end
