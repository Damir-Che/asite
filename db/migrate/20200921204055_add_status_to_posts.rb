class AddStatusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :kind, :integer, default: 0
  end
end
