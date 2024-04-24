class AddUserIdToErrors < ActiveRecord::Migration[7.1]
  def change
    add_column :errors, :user_id, :integer
    add_index :errors, :user_id
  end
end
