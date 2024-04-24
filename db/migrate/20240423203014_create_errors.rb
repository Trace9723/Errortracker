class CreateErrors < ActiveRecord::Migration[7.1]
  def change
    create_table :errors do |t|
      t.string :name
      t.string :priority
      t.text :description
      t.string :person_assigned
      t.date :date_found

      t.timestamps
    end
  end
end
