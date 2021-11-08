class CreateBios < ActiveRecord::Migration[6.1]
  def change
    create_table :bios do |t|
      t.text :body

      t.timestamps
    end
  end
end
