class AddProgressToErrors < ActiveRecord::Migration[7.1]
  def change
    add_column :errors, :progress, :string
  end
end
