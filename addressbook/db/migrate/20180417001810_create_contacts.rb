class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
