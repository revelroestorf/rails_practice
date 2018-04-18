class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    change_column 'users', 'active', :boolean, default: true
    change_column 'users', 'admin', :boolean, default: false

  end
end
