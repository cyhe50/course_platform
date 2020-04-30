class AddUsernameToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :username, :string
    add_index :managers, :username, unique: true
  end
end
