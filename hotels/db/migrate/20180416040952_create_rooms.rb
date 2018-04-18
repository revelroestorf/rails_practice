class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.string :name
      t.string :ppn

      t.timestamps
    end
  end
end
