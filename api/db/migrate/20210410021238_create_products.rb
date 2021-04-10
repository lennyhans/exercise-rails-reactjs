class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :brand
      t.integer :ammount
      t.integer :price
      t.integer :category_id

      t.timestamps
    end
  end
end
