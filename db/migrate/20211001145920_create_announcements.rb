class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
