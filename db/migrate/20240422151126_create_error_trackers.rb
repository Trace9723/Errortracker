class CreateErrorTrackers < ActiveRecord::Migration[7.1]
  def change
    create_table :error_trackers do |t|
      t.string :name
      t.integer :priority
      t.text :description
      t.string :assigned_to
      t.date :date

      t.timestamps
    end
  end
end
