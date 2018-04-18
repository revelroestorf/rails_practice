class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
