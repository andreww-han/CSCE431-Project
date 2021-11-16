class AddNumlikesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :numlikes, :integer, default: 0
  end
end
