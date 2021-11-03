class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
