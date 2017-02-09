class TableUsersSecurePasswords < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :passord_digest 
  end
end
