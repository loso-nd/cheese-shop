class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.string :description
      t.boolean :my_type

      t.timestamps
    end
  end
end
