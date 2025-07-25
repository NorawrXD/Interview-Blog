class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
    # Only add columns if they don't exist
    add_column :users, :encrypted_password, :string, null: false, default: "" unless column_exists?(:users, :encrypted_password)
    
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
    
    # Add indexes only if they don't exist
    add_index :users, :email, unique: true, if_not_exists: true
    add_index :users, :reset_password_token, unique: true, if_not_exists: true
  end
end