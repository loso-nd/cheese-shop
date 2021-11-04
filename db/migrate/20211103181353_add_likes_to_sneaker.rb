class AddLikesToSneaker < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :likes, :integer, null: false, default: 0
  end
end
