class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :rid,                unique: true
      t.string :name,               null: false

      t.integer :created_by_id
      t.integer :updated_by_id
      t.integer :deleted_by_id
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :categories, :deleted_at
  end
end
