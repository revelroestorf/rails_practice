class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
