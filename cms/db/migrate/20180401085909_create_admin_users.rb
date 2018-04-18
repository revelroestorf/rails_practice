class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|

      t.string 'first_name', :limit => 25
      t.string 'last_name', :limit => 50
      t.string 'username', :limit => 25
      t.string 'email', :limit => 50, :null => false
      t.string 'password', :limit => 40

      t.timestamps
    end
    add_index('admin_users', 'username')
  end
end
